function [v_cur, lambda] = uzawa_project_ellipses(c, v_prime, h)

n = size(c, 1);
lambda = zeros(n*(n - 1)/ 2, 1);

v_cur = zeros(n, 1);
v_last = zeros(n, 1); 
error_k = Inf;

[B, distances] = normals_and_distances_ellipses(c);
B = -h * B; % columns are normal vectors that span normal cone at c
signed_distances = distances; % at this point we have no signed ellipses
total_steps = 0;
while error_k > 1e-5
	v_last = v_cur;
	
	solve_unconstrained = @(lambda) v_prime - B * lambda;
	% we embedded the real problem into the complex one, so the real/conj nonsense is to project back. Note that the transpose is conjugate transpose, that's importnat
	constraint_gradient = @(v_new) real(B' * v_new) - signed_distances;
	
	% On choosing rho:
	% According to the uzawa algorithm, we have the rho < 2 / |B'|. We know from matrix inequalities that |A| <= \sqrt{m} |A|_\infty where m is the number of rows of A and |A|_\infty is the max of the row sums. In fact, for B', the row sums are always 2, so this is easy to compute. Our bound is then 1/\sqrt{m} <= 2 / |B'| so it suffices to choose \rho < 1/N(N - 1)/2 or slightly stronger \rho < 1/N^2
	[v_cur, lambda] = uzawa(lambda, solve_unconstrained, constraint_gradient, .005);
	error_k = sum(abs(v_cur - v_last));
	total_steps = total_steps + 1; 
end	

total_steps;

end

