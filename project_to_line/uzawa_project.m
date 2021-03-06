function [v_cur, lambda] = uzawa_project(q, desired_v)
% todo: everything should be in terms of complex numbers and complex matrices.
% The general problem is quadratic J(u) over region described by Cu \leq d.
% Q: is projecting position really different than projecting velocity? I don't think so. 
lambda = 0;

projected_gradient_step = 2;

v_cur = [Inf; Inf];
v_last = [Inf; inf]; 
error_k = Inf;

timestep = .2;

normal = [-1 -1];

distance_to_plane = dot(normal, q) - 0;
plane_offset = -distance_to_plane; % desired offset is zero currently

normal = timestep * normal; % watch out that you don't compute the distance to the plane after adjusting for the timestep
total_steps = 0;

while error_k > 1e-6 || total_steps > 600 
	v_last = v_cur;
	
	solve_unconstrained = @(lambda) desired_v - normal' * lambda;
	constraint_gradient = @(v_new) normal * v_new - plane_offset;
	
	% todo: how to choose rho? Right now we just set rho = .5
	[v_cur, lambda] = uzawa(lambda, solve_unconstrained, constraint_gradient, projected_gradient_step);
	error_k = l1_norm(v_cur - v_last);
	total_steps = total_steps + 1; 
end	

total_steps;

end
