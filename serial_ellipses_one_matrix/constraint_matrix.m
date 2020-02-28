function M = constraint_matrix(q)
n = length(q);
M = zeros(n, n * (n - 1) / 2);
k = 1;

for i = 1:(n - 1)
	for j = (i + 1):n
		v = normal_vector_between_circles(q, i, j);
		M(:, k) = v;
		k = k + 1;
	end
end

end
