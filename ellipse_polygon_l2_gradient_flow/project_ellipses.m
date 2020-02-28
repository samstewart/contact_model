function ellipses = project_ellipses(ellipses, short_radius, long_radius, n)

	ellipses_approximated_as_polygons = points_on_boundary(ellipses, short_radius, long_radius, n);
	
	ellipses_approximated_as_polygons = polygon_project(ellipses_approximated_as_polygons, []);

	ellipses = ellipses_from_points_on_boundary(ellipses_approximated_as_polygons, short_radius, long_radius) 	;
end
