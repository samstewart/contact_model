function d = distance_to_ellipse(config,short_radius, long_radius, q)
q = real_to_complex_vector(q);
ps = points_on_boundary(config, short_radius, long_radius, 500);
dists = abs(ps - q);
d = min(dists);
end
