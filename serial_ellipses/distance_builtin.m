function t = distance_builtin(x1, x2, evolute1, evolute2)
	complex_cross = @(z1, z2)  imag(conj(z1) * z2);
	
	objective1 = @(t) complex_cross(x1(t) - evolute1(t), 
	v1 = @(t) x(t) - evolute1(t);
	v2 = @(t) p - evolute1(t);
	
	jacobian = @(t) 	
	t

end
