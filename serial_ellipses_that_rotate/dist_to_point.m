function [t1, d] = dist_to_point(ellipse, t1, p, w, n)
thetas = t1 + linspace(-w, w, 2 *n + 1);
ps = points_on_boundary_in_interval(ellipse, thetas);

minp = 0;

dists = abs(ps - p);
if inside_ellipse(ellipse, p)
	dists = -dists;
end

[d, m] = min(dists);

t1 = thetas(m);
end
