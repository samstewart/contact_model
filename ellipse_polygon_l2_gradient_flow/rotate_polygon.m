function rotated = rotate_polygon(polygon, rotation)
	centers = centers_of_mass_of_polygons(polygon);
	rotated = rotation * (polygon - centers) + centers; 
end
