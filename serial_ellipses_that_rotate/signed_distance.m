function d = signed_distance(c1, c2, p1, p2)
	s = 1
	if inside_ellipse(c1, p2) && inside_ellipse(c2, p1)
		s = -1
	end
	d = s * abs(p1 - p2);
end


