function [v_cur, lambda] = uzawa_project(ellipse, v_prime, h)
% todo: everything should be in terms of complex numbers and complex matrices.
% The general problem is quadratic J(u) over region described by Cu \leq d (semidefinite problem).

lambda = 0;
v_cur = Inf + i * Inf;
v_last = Inf + i * Inf; 
error_k = Inf;

[t1, t2, d] = dist_between_ellipses([1 0], ellipse, 5, 6);
if d < 1e-4 
	
	% rows are normal vectors 
	% Q: what is the relationship of the unit normal to the line through their centers?
	B =  h*unit_normal_to_ellipse(ellipse, t2, 5, 6);  

	total_steps = 0;
	while error_k > 1e-4

		v_last = v_cur; 
	 
		% how much of normal vector we should be subtracting to bring v_prime into tangent space	
		solve_unconstrained = @(lambda) v_prime - lambda * B;

		% dual problem tries to drive this to zero (project velocity so that it has zero component along normal B)
		constraint_gradient = @(v_new) complex_dot(B, v_new); % does it really matter for stability that we subtract 'd'?  	

		% todo: how to choose rho?
		[v_cur, lambda] = uzawa(lambda, solve_unconstrained, constraint_gradient, 1/h^2);

		% look for the error to start decreasing to show we are converging
		error_k = abs(v_cur - v_last);
		total_steps = total_steps + 1; 
	end	 
       	total_steps;
else
	v_cur = v_prime;
end

end
