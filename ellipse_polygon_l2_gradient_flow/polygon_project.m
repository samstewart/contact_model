function polygons = polygon_project(polygons, obstacles )
% only worry about two
							
polygonA = polygons(:, 1);
polygonB = polygons(:, 2);

if polygons_overlap(polygonA, polygonB)	

	[rotations, translations] = affine_transforms_towards_resolving_collision(polygonA, polygonB);
	
	% todo: turn into matrix multiplication	
	polygons(:, i_polygon) = rotate_polygon(polygonA, transform(1, 1)) + transform(1, 2);
	polygons(:, j_polygon) = rotate_polygon(polygonB, transform(2, 1)) + transform(2, 2);
end

end
