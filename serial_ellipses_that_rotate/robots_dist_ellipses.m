function [w1, w2, d] = robots_dist_ellipses(c1, c2, a, b)

w1 = points_on_boundary_in_interval(c1, pi/4);

for n = 1:60
	w2 = robots_proj_point(c2,a,b,w1);
       w1 = robots_proj_point(c1, a, b, w2)	;
end
d = abs(w1 - w2);
end

