function delta_t = compute_delta_t(t, x, inf_arc_length, evolute, p)

	complex_cross = @(z1, z2)  imag(conj(z1) * z2);
	v1 = x(t) - evolute(t);
	v2 = p - evolute(t);
	
	% should be cross product because we need to track sign 
	radius = abs(x(t) - evolute(t));
	delta_c = radius * asin(complex_cross(v1, v2)/(abs(v1)*abs(v2)));

	delta_t = delta_c / inf_arc_length(t);
end
