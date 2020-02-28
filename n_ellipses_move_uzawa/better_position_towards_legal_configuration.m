function move = better_position_towards_legal_configuration(i, ellipses, obstacles, short_radius, long_radius, step_size)
	% available moves (one in each direction of points on the circle)
			
	% sample possible other positions

	% randomly order moves to break ties among moves that look equally good.
	possible_moves = possible_positions_and_orientations(ellipses(i, :), 2, 2, step_size)
	
	distances = distances_between_ellipses(possible_moves, ellipses, obstacles, short_radius, long_radius)

	% ignore distance to the ellipse we are considering moving
	distances(:, i) = Inf;
	
	move_scores = min(distances, [], 2);
	
	% ask vladimir: how do I handle the bug where the same move is chosen
	% n_moves = 2
	% better_position_towards_legal_configuration(2, [0; 1/2], [1 + 1i 1 - 1i;], 1/2, 1/8)
	
	% find the move that takes us farthest away from intersecting another circle
	[best_score, best_move] = max(move_scores);
	
	move = possible_moves(best_move, :);
end
