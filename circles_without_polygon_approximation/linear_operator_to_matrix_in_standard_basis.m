function M = linear_operator_to_matrix_in_standard_basis(L, n)
% takes L : V -> W with dim V = n and returns the matrix
% representation. L should take and return column vectors.
m = size(L(eye(n, 1)), 1);
M = zeros(m, n);


for i = 0:(n - 1)
    % shift the standard basis vector repeatedly to get all basis vectors
    M(:, i + 1) = L(circshift(eye(n, 1), i));
    
end

end