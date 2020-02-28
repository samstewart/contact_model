function [v_cur, lambda] = uzawa_project(q, desired_v, block_point)
% todo: everything should be in terms of complex numbers and complex matrices.
% The general problem is quadratic J(u) over region described by Cu \leq d.
% Q: is projecting position really different than projecting velocity? I don't think so. 
lambda = 0;

projected_gradient_step = .5;
R = 5;
v_cur = [Inf; Inf];
v_last = [Inf; Inf]; 
error_k = Inf;

timestep = .01;

config = [exp(q(3) * i) q(1) + i*q(2)];
distance_to_boundary = lies_on_ellipse(config, 5, 8, block_point);
% note: the units are wrong here, is this like the algebraic distance? Anyway, it doesn't matter because all we need is a signed distance measure from the boundary.
if distance_to_boundary < .1

	normal = -unit_normal_to_rotation(config, 5, 8, block_point)'
	normal = timestep * normal; % watch out that you don't compute the distance to the plane after adjusting for the timestep
	total_steps = 0;
	coeff = 6; % Q: what is the right multiplier on this? We can look at the graph and see what happens.
	while error_k > 1e-5 && total_steps < 600 
		v_last = v_cur;
		
		solve_unconstrained = @(lambda) desired_v - normal' * lambda;
		% what should we be multiplying by?
		constraint_gradient = @(v_new) normal * v_new - coeff * distance_to_boundary; % try to send this to zero, that's what lambda is for
		% todo: add correction factor for when we are near the boundary?

		% todo: how to choose rho? Right now we just set rho = .5
		[v_cur, lambda] = uzawa(lambda, solve_unconstrained, constraint_gradient, projected_gradient_step);
		error_k = l1_norm(v_cur - v_last);
		total_steps = total_steps + 1;
	end	
	error_k
	constraint_sat = normal * v_cur - coeff * distance_to_boundary
	total_steps
else
	v_cur = desired_v;
end
end
