function is_illegal = is_illegal_configuration(q, obstacles, radius)
	% are the agents intersecting each other?
	is_illegal = any(pdist(q, @(z1, z2) abs(z1 - z2)) < 2 * radius);
	
	% are any of the agents intersecting the obstacles
	for i = 1:size(obstacles, 1)
		for j = 1:size(q, 1)
			is_illegal = is_illegal | (dist_from_point_to_line(q(j), obstacles(i, 1), obstacles(i, 2)) < radius);
		end
	end
end
