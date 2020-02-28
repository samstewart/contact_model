function M = difference_matrix(q)
% computes the matrix that results in the vector e_ij \cdot (q_i - q_j) for
% i > j. Remember that each q_i has two components, so we are looking at
% vectors in 2n.

M = linear_operator_to_matrix_in_standard_basis(@(q_prime) sign_adjusted_pairwise_differences(q, q_prime), size(q, 1));

end
