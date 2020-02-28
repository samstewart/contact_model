function min_normal = min_overlap_edge_normal(polygonA, polygonB)
	
	% I bet there is a way to vectorize this with respect to the polygons as well?
	% todo: randomly break ties for best direction (do this by randomly shuffling edges)?
	edge_normals = shuffle([unit_normals(polygonA); unit_normals(polygonB)]);

	intervalsA = shadow_intervals_of_polygon_along_edges(polygonA, edge_normals);
	intervalsB = shadow_intervals_of_polygon_along_edges(polygonB, edge_normals);

	overlaps = intervals_overlap(intervalsA, intervalsB);
	[min_overlap, min_overlap_index] = min(abs(overlaps));

	min_normal = edge_normals(min_overlap_index);

	% special case correction to direction to align movement so that centers of polygons are moving apart
	centers = centers_of_mass_of_polygons([polygonA polygonB]);

	average_movement_direction = centers(1) - centers(2);

	% use fact that cos \theta = real(a * conj(b))
	dot_product = real(average_movement_direction * conj(min_normal));

	min_normal = sign(dot_product) * min_overlap * min_normal;
end
