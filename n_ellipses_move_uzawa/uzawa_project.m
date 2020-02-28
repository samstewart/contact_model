function [v_cur, lambda] = uzawa_project(ellipses, v_preferred, h)
% todo: everything should be in terms of complex numbers and complex matrices.
% The general problem is quadratic J(u) over region described by Cu \leq d (semidefinite problem).

n = size(ellipses, 1);
lambda = zeros(n * (n - 1) / 2, 1);
v_cur = Inf * ones(length(v_preferred), 1);
error_k = Inf;

[t1, t2, normal, d] = dist_between_ellipses(ellipses, 5, 5);

% we divide by 2 so that B has norm h 


% rows are normal vectors 
% Q: what is the relationship of the unit normal to the line through their centers?
B =  constraint_matrix(ellipses, normal, h);
total_steps = 0;
while error_k > 1e-4

	v_last = v_cur; 
 
	% how much of normal vector we should be subtracting to bring v_prime into tangent space	
	% todo: make sure to add transposes / track column vectors because this is a crude type system for tracking what's in the dual and what isn't
	solve_unconstrained = @(lambda) v_preferred - transpose(B) * lambda;

	% dual problem tries to drive this to zero (project velocity so that it has zero component along normal B)
	
	constraint_gradient = @(v_new) real(B * conj(v_new)) - d; % does it really matter for stability that we subtract 'd'? It seems more stable then if we impose the hard cutoff. I'd like to understand this better.

	% todo: how to choose rho? (what is the norm of B (equivalently biggest eigenvalue)?)

	[v_cur, lambda] = uzawa(lambda, solve_unconstrained, constraint_gradient, 1 / h^2);

	% look for the error to start decreasing to show we are converging
	error_k = sum(abs(v_cur - v_last));
	
	total_steps = total_steps + 1; 
end	 
total_steps;

end
