function v = complex_matrix_mult(A, v)
v = real(A * conj(transpose(v)))
end
