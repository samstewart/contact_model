function projected = random_project(cur, desired)

grid_size = .42*.2/10;
n_grid = 5;

	% generate possible positions
	reals = grid_size * (-n_grid:n_grid);
	imags = reals;
	
	clear i
	rotation_grid = cur(1) * exp(i * 2 * pi/1000 * (-2:2)); 
	translation_grid = cur(2) + complex_grid(reals, imags); 

	trans_and_rots = cartesian_product(rotation_grid, translation_grid);

	illegal_points = zeros(1, size(trans_and_rots, 1));

	for k = 1:size(trans_and_rots, 1) 
	       	illegal_points(k) = ellipses_overlap([1 0], trans_and_rots(k, :), 5, 6);
        end 
 
	illegal_points = logical(illegal_points); 

	angle_dists = abs(angle(trans_and_rots(:, 1) / desired(1))) ;
	translation_dists = abs(trans_and_rots(:, 2) - desired(2));

	dists_to_desired_point = 600*translation_dists + 1/1000* angle_dists;

	dists_to_desired_point(illegal_points) = Inf;

	% circle is at origin with radius 5
	[score, k] = min(dists_to_desired_point);

	if score == Inf
		projected = desired; % can't move at all! 
	else
		projected = trans_and_rots(k, :); 
	end

end
