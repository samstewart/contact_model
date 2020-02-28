function cms = centers_of_mass_of_polygons(polygons)

cms = transpose(mean(polygons, 1));

end
