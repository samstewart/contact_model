function overlap = overlap_between_configurations(polygonA, polygonB, configurationA, configurationB)

transformedA = affine_transforms_on_polygons(polygonA, configurationA(1), configurationA(2));
transformedB = affine_transforms_on_polygons(polygonB, configurationB(1), configurationB(2));

overlap = abs(min_overlap_edge_normal(transformedA, transformedB));

end
