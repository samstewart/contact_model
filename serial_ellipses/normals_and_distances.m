function [normals, distances] = normals_and_distances(q)
n = length(q);
normals = zeros(n, n * (n - 1) / 2);
distances = zeros(n*(n - 1) / 2, 1);
k = 1;

for i = 1:(n - 1)
	for j = (i + 1):n
		v = normal_vector_between_circles(q, i, j);
		normals(:, k) = v;
        	distances(k) = abs(q(i) - q(j));

		k = k + 1;
	end
end


end
