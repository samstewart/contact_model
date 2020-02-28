function [min_val, min_index] = min_index_of_matrix(A)
min_val = Inf;
min_index = [Inf Inf];

for i = 1:size(A, 1)
	for j = 1:size(A, 2)

		if A(i, j) < min_val

			min_index = [i j];
			min_val = A(i, j);

		end

	end
end
end
