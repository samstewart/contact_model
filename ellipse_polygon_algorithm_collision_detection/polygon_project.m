function polygons = polygon_project(polygons, obstacles )

% look at all pairs of intersections (i, j) for i > j.
for i_polygon = 1:size(polygons, 2)

	for j_polygon = 1:size(polygons, 2)

		if i_polygon < j_polygon 
			
							
			polygonA = polygons(:, i_polygon);
			polygonB = polygons(:, j_polygon);
			
			if polygons_overlap(polygonA, polygonB)	
				transform = affine_transformation_that_resolves_collision(20, polygonA, polygonB);
				
				% todo: turn into matrix multiplication	
				polygons(:, i_polygon) = rotate_polygon(polygonA, transform(1, 1)) + transform(1, 2);
				polygons(:, j_polygon) = rotate_polygon(polygonB, transform(2, 1)) + transform(2, 2);
			end
		end

	end

end

end
