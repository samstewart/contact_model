function q_cur = random_project(q, desired_q)
grid_size = .01;

if abs(desired_q) - 5 < 0
	grid = q + complex_grid(grid_size * (-5:5), grid_size * (-5:5));

	dists_to_circle_center = arrayfun(@(x) abs(x) - 5, grid);
	

	illegal_points = dists_to_circle_center < 0;

	illegal_points = illegal_points | ~sample_matrix(size(grid), .5) ; 
	
	dists_to_desired_point = arrayfun(@(x) abs(x - desired_q), grid);

	dists_to_desired_point(illegal_points) = Inf;

	% circle is at origin with radius 5
	[score, i, j] = matrix_min(dists_to_desired_point);

	if score == Inf
		disp('cant move')
		q_cur = q; % can't move at all! 
	else
		q_cur = grid(i, j); 
	end
else
	q_cur = desired_q;
end

end
