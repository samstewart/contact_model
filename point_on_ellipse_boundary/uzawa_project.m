function [v_cur, lambda] = uzawa_project(q, v_prime, radius, h)
% todo: everything should be in terms of complex numbers and complex matrices.
% The general problem is quadratic J(u) over region described by Cu \leq d.
% Q: is projecting position really different than projecting velocity? I don't think so. 
n = length(q) / 2;
lambda = zeros(n*(n - 1)/ 2, 1);


v_cur = Inf * ones(length(q), 1);
v_last = Inf * ones(length(q), 1); 
error_k = Inf;

B = -h * constraint_matrix(q);
distances = pairwise_distances(q) - 2 * radius;

total_steps = 0;
while error_k > 1e-5
	v_last = v_cur;
	
	solve_unconstrained = @(lambda) v_prime - B' * lambda;
	constraint_gradient = @(v_new) B * v_new - distances;
	
	% todo: how to choose rho?
	[v_cur, lambda] = uzawa(lambda, solve_unconstrained, constraint_gradient, .5);
	error_k = l1_norm(v_cur - v_last);
	total_steps = total_steps + 1; 
end	

total_steps;

end
