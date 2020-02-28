function z = column_vector_to_complex(v)
	% converts R^{2N} vector to C^N vector
	z = v(1:2:end) + v(2:2:end) * i; 
end
