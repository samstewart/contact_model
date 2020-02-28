function [v_cur1, v_cur2, lambda] = uzawa_project(ellipse1, ellipse2, v_prime1, v_prime2, h)
% todo: everything should be in terms of complex numbers and complex matrices.
% The general problem is quadratic J(u) over region described by Cu \leq d (semidefinite problem).

lambda = 0;
v_cur1 = Inf + i * Inf;
v_last1 = Inf + i * Inf; 
error_k = Inf;
v_cur2 = Inf + i * Inf;
v_last2 = Inf + i * Inf; 


[t1, t2, d] = dist_between_ellipses(ellipse1, ellipse2, 5, 6);

	% rows are normal vectors 
	% Q: what is the relationship of the unit normal to the line through their centers?
	B1 =  h*unit_normal_to_ellipse(ellipse1, t1, 5, 6);  
	B2 =  -B1; % needs to move in the opposite direction (can we extend this to rotations?)

	total_steps = 0;

	while error_k > 1e-5

		v_last1 = v_cur1; 
		v_last2 = v_cur2; 
	 
		% how much of normal vector we should be subtracting to bring v_prime into tangent space	
		solve_unconstrained = @(lambda) [(v_prime1 - lambda * B1) (v_prime2 - lambda * B2)];

		% dual problem tries to drive this to zero (project velocity so that it has zero component along normal B)
		
		constraint_gradient = @(v_new) complex_dot(B1, v_new(1)) + complex_dot(B2, v_new(2)) - d; % does it really matter for stability that we subtract 'd'? It seems more stable then if we impose the hard cutoff. I'd like to understand this better.

		% todo: how to choose rho? (what is the norm of B (equivalently biggest eigenvalue)?)

		[vp, lambda] = uzawa(lambda, solve_unconstrained, constraint_gradient, 1/(2*h^2));
		v_cur1 = vp(1);
		v_cur2 = vp(2);

		% look for the error to start decreasing to show we are converging
		error_k = abs(v_cur1 - v_last1) + abs(v_cur2 - v_last2);
		total_steps = total_steps + 1; 
	end	 
       	total_steps;

end
