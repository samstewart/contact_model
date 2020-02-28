function [v_cur, lambda] = uzawa_project(q, desired_v)
% todo: everything should be in terms of complex numbers and complex matrices.
% The general problem is quadratic J(u) over region described by Cu \leq d.
% Q: is projecting position really different than projecting velocity? I don't think so. 
lambda = 0;

projected_gradient_step = .5;
R = 5;
v_cur = [Inf; Inf];
v_last = [Inf; Inf]; 
error_k = Inf;

timestep = .2;

% normal = -q' / l2_norm(q); % needs to be pointing *into* the illegal zone (doesn't work for some reason if it's a unit vector?)


distance_to_boundary = l2_norm(q - 0) - R; % needs to be in euclidean metric
distance_to_boundary = lies_on_ellipse([1 0], 5, 8, q); 
% note: the units are wrong here, is this like the algebraic distance? Anyway, it doesn't matter because all we need is a signed distance measure from the boundary.
if distance_to_boundary < .1
	normal = -unit_normal_to_ellipse([1 0], 5, 8, q)';
	normal = timestep * normal; % watch out that you don't compute the distance to the plane after adjusting for the timestep
	total_steps = 0;

	while error_k > 1e-5 || total_steps > 600 
		v_last = v_cur;
		
		solve_unconstrained = @(lambda) desired_v - normal' * lambda;
		constraint_gradient = @(v_new) normal * v_new - distance_to_boundary;
		% todo: add correction factor for when we are near the boundary?

		% todo: how to choose rho? Right now we just set rho = .5
		[v_cur, lambda] = uzawa(lambda, solve_unconstrained, constraint_gradient, projected_gradient_step);
		error_k = l1_norm(v_cur - v_last);
		total_steps = total_steps + 1; 
	end	

	total_steps;
else
	v_cur = desired_v;
end
end
