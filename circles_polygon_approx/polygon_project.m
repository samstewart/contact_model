function polygons = polygon_project(polygons, obstacles )

% look at all pairs of intersections (i, j) for i > j.
for i_polygon = 1:size(polygons, 2)

	for j_polygon = 1:size(polygons, 2)

		if i_polygon < j_polygon 
			
			polygonA = polygons(:, i_polygon);
			polygonB = polygons(:, j_polygon);
			
			% I wonder if this technique is the same as Dinesh's paper?
			% correction vector to put us back on legal configurations
			correction = min_overlap_edge_normal(polygonA, polygonB);
			polygonA = polygonA + 1/2 * correction;
			polygonB = polygonB - 1/2 * correction;

			polygons(:, i_polygon) = polygonA;
			polygons(:, j_polygon) = polygonB;
		end

	end

end

end
