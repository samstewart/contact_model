function signed_d = signed_dist_between_points_on_ellipses(e1, e2, p1, p2)
	overlap = sign(complex_dot(e1(2) - e2(2), p1 - p2));
	signed_d = overlap * abs(p1 - p2);
end
