function d = signed_ellipse_dist(c1, c2, p1, p2)
	if inside_ellipse(c1, p2) || inside_ellipse(c2, p1)
		d = -abs(p1 - p2);
	else
		d = abs(p1 - p2);
	end		

end
