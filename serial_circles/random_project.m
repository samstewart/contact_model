function projected = random_project(k, cur_x, desired_x)

grid_size = .42*.2/10;
n_grid = 6;

	% generate possible positions
	reals = grid_size * (-n_grid:n_grid);
	imags = reals;
	
	x = cur_x(k) + complex_grid(reals, imags); 

	illegal_points = zeros(length(x), 1);
	for m = 1:length(illegal_points)
		illegal_points(m) = overlaps_other_circles(k, cur_x, x(m));
	end
	
	illegal_points = logical(illegal_points);

	translation_dists = abs(x - desired_x);

	translation_dists(illegal_points) = Inf; % points where circles overlap are illegal

	% circle is at origin with radius 5
	[score, m] = min(translation_dists);
	projected = x(m); 

end
