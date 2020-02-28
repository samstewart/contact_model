function d = dist_between_two_ellipses(ellipse1, ellipse2, short_radius, long_radius)

num_points_on_boundary = 50;

% first row is points on boundary of ellipse1, second row is points on boundary of ellipse2
points = points_on_boundary([ellipse1; ellipse2], short_radius, long_radius, num_points_on_boundary);

% compute the min pairwise distance
d = Inf;

for i = 1:num_points_on_boundary
	for j = 1:num_points_on_boundary

		d = min(d, abs(points(1, i) - points(2, j)) );

	end
end
end
