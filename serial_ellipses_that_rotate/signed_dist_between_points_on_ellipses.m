function signed_d = signed_dist_between_points_on_ellipses(e1, e2, p1, p2)
% this method is unstable
%	overlap = sign(complex_dot(e1(2) - e2(2), p1 - p2));
overlap1 = inside_ellipse(e1, p2);
overlap2 = inside_ellipse(e2, p1);
overlap = 1;
if overlap1 && overlap2
	overlap = -1;
end
	signed_d = overlap * abs(p1 - p2);
end
