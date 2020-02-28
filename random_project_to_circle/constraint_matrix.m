function M = constraint_matrix(q)
n = length(q);

M = linear_operator_to_matrix_in_standard_basis(@(v) sign_adjusted_pairwise_differences(q, v), n);
end
