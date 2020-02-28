function w = robots_point_on_ellipse(a,b,t)
	x = [cos(t); sin(t)];
	w = diag([a b]) * x;
end
