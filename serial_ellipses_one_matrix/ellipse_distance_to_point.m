function d = ellipse_distance_to_point(ellipse, p)
theta = angle(1/ellipse(1) * (p - ellipse(2)));
% always should be odd number of points to include zero
ps = points_on_boundary_in_interval(ellipse, linspace(-pi/60, pi/60, 21) + theta);


dists = abs(ps - p);
if inside_ellipse(ellipse, p)
	dists = -dists;
end

d = min(dists);
end
