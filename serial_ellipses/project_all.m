function v_cur = project_all(v_prime, c, L, max_length, max_speed, h, rho)
n = size(c, 1);
lambda = zeros(n * (n - 1)/2, 1);
v_cur = zeros(2 * n, 1); % velocity has rotational and translation velocity
v_last = zeros(2 * n, 1); 
[constraint_normals, signed_distances] = normals_and_distances_ellipses(c, max_length, max_speed);
error_k = Inf;
for i = 1:n
	for j = (i + 1):n
	% the rotation normals should have the same sign / direction, or that might depend on the rotation
	c1 = c(i, :);
	c2 = c(j, :);
	% let's first just test that it works with normal translations
	%constraint_normals = zeros(2,1)
	%constraint_normals = [n1; n2];
	% diagonal matrix with penalty L for rotation
	Ainv = zeros(2 * n, 1);
	Ainv(1:2:end) = 1;
	Ainv(2:2:end) = 1/L;  
	total_steps = 0;
	while error_k > 1e-4 
		v_last = v_cur;
		% the 1/L will slow descent in the rotational coordinates
		% can Alex's publication use Uzawa? Is Uzawa just another form of coordinate descent?
		v_cur = Ainv .* (v_prime - (-h * constraint_normals * lambda));
		% this is just the slack Ax + b which we want to drive to zero
		constraint_gradient = complex_dot(-h * transpose(constraint_normals), v_cur) - signed_distances;
		lambda = max(0, lambda + rho * constraint_gradient);
		error_k = sum(abs(max(0, rho * constraint_gradient)));
		total_steps = total_steps + 1
	end	
	end
end
end
