function q_cur = random_project(q, desired_q)
grid_size = .42*.2/4;

n_grid = 4;
	% generate possible positions
	grid = q + complex_grid(grid_size * (-n_grid:n_grid), grid_size * (-n_grid:n_grid));

	dist_to_ellipse_center_constraint = arrayfun(@(x) dist_between_ellipses([1 0], [1 x], 5, 6), grid);

	illegal_points = dist_to_ellipse_center_constraint <= 0;   
	
	dists_to_desired_point = arrayfun(@(x) abs(x - desired_q), grid);

	dists_to_desired_point(illegal_points) = Inf;

	% circle is at origin with radius 5
	[score, i, j] = matrix_min(dists_to_desired_point);

	if score == Inf
		q_cur = q; % can't move at all! 
	else
		q_cur = grid(i, j); 
	end

end
