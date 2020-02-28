function B = constraint_matrix(ellipses, normals, h)
n = size(ellipses, 1);

B = h * linear_operator_to_matrix_in_standard_basis(@(v) sign_adjusted_pairwise_differences(normals, v), n);
end
