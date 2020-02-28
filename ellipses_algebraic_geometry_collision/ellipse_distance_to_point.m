function d = ellipse_distance_to_point(ellipse, p)
theta = angle(1/ellipse(1) * (p - ellipse(2)));
ps = points_on_boundary_in_interval(ellipse, theta, pi/50, 3);

minp = 0;

dists = abs(ps - p);
if inside_ellipse(ellipse, p)
	dists = -dists;
end

d = min(dists);
end
