function M = linear_operator_to_matrix_in_standard_basis(L, n)
% takes L : V -> W with dim V = n (complex dimension) and W real vector space and returns the matrix
% representation as *complex* numbers. L should take and return column vectors.
m = size(L(eye(n, 1)), 1);
M = zeros(m, n);


for k = 0:(n - 1)
    % shift the standard basis vector repeatedly to get all basis vectors
    e_k = circshift(eye(n, 1), k) ;
    M(:, k + 1) = real(L(e_k)) + i * real(L(e_k * i));
    
end

end
