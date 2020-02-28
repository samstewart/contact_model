function delta_t = robots_compute_delta_t(a, b, t, p)
	x = [cos(t); sin(t)];
	point_on_ellipse = robots_point_on_ellipse(a,b,t);
	circle_center = (a^2 - b^2) * diag([1/a; -1/b]) * (x.^3);
	
	line_to_tangent_point = point_on_ellipse - circle_center;
	proj_onto_circle = p - circle_center;

        r1 = hypot(line_to_tangent_point(2), line_to_tangent_point(1)); % will be radius of osculating circle
        r2 = hypot(proj_onto_circle(2), proj_onto_circle(1));
%
%        delta_c = r1 * acos(dot(line_to_tangent_point, proj_onto_circle)/(r1*r2));
	r = line_to_tangent_point;
	q = proj_onto_circle;
	
	% the issue is that the actual equilibrium is unstable. We need some way to track a sign on delta_c. An interesting graph would be delta_c near the desired t (just a small neighborhood. 
        delta_c = r1 * asin((r(1)*q(2) - r(2)*q(1))/(r1*r2));
        delta_t = delta_c / sqrt(a^2 + b^2 - dot(point_on_ellipse, point_on_ellipse));
	
end
