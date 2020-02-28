function [v_cur, lambda] = uzawa_project_ellipses(c, v_prime, h)

n = size(c, 1);
lambda = zeros(n*(n - 1)/ 2, 1);
v_cur = zeros(n, 1);
v_last = zeros(n, 1); 
error_k = Inf;

t1 = tic;
[B, distances] = normals_and_distances_ellipses(c);
toc(t1)

B = -h * B; % columns are normal vectors that span normal cone at c
signed_distances = distances; % at this point we have no signed ellipses;

% visualize the overlap
% uses uzawa algorithm to solve saddle point problem
total_steps = 0;
tstart = tic;
B(1, :)
while error_k > 1e-4
	v_last = v_cur;
	
		
	% Choosing rho: According to the uzawa algorithm, we have the rho < 2 / |B'|. We know from matrix inequalities that |A| <= \sqrt{m} |A|_\infty where m is the number of rows of A and |A|_\infty is the max of the row sums. In fact, for B', the row sums are always 2, so this is easy to compute. Our bound is then 1/\sqrt{m} <= 2 / |B'| so it suffices to choose \rho < 1/N(N - 1)/2 or slightly stronger \rho < 1/N^2 where N is the number of contacts
	rho = .5; 
	v_cur = v_prime - B * lambda;
	
	% the columns of B are vectors for pushing (i,j) apart so there is one for every pairing. will be in space dimension N(N - 1)/2
	% row i of B has vectors sign(i - j) e_{ij} (roughly speaking)
	% action on constraints is thus sign(i - j) e_{ij} . \lambda_{ij}
	% action on velocity of B^T is e_ij . v_i - e_ij . v_j (this tells us how much net velocity in direction of constraint \lambda_ij.
	% note that \lambda_ij = 0 for legal velocities
	% real(B' * v_new) is the matrix mult B^T * v_new in complex coordinates
	% dual gradient points in direction of violated constraints
	constraint_gradient = real(B' * v_cur) - signed_distances;

	lambda = max(0, lambda + rho * constraint_gradient);

	error_k = sum(abs(v_cur - v_last));
	total_steps = total_steps + 1; 
end	
toc(tstart)
total_steps

end

