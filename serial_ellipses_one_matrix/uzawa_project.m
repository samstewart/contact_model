function [v_cur, lambda] = uzawa_project(q, v_prime, radius, h)

n = length(q);
lambda = zeros(n*(n - 1)/ 2, 1);

v_cur = zeros(length(q), 1);
v_last = zeros(length(q), 1); 
error_k = Inf;

[B, distances] = normals_and_distances(q);
B = -h * B; % columns are normal vectors that span normal cone at q
signed_distances = distances - 2 * radius
total_steps = 0;
while error_k > 1e-5
	v_last = v_cur;
	
	solve_unconstrained = @(lambda) v_prime - B * lambda;
	% we embedded the real problem into the complex one, so the real/conj nonsense is to project back. Note that the transpose is conjugate transpose, that's importnat
	constraint_gradient = @(v_new) real(B' * v_new) - signed_distances;
	
	% todo: how to choose rho?
	[v_cur, lambda] = uzawa(lambda, solve_unconstrained, constraint_gradient, .5);
	error_k = sum(abs(v_cur - v_last));
	total_steps = total_steps + 1; 
end	

total_steps;

end
