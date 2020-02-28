function z = real_to_complex_vector(v)
	z = v(1:2:end) + i * v(2:2:end); 
end
