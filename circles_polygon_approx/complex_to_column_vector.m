function v = complex_to_two_column_vector(z)
	v = zeros(2 * size(z, 1), 1);
	v(1:2:end) = real(z);
	v(2:2:end) = imag(z);
end
