function intervals = shadow_intervals_of_polygon_along_edges(polygon, edge_normals)

% the case with the line and zero aligned with real axis is easy: project by taking the real part. Projections are invariant under affine group (?) so we can reduce problem via affine transformations to the first case. 
% rotate to align each line with real axis
% todo: rewrite with the affine_transforms_on_polygons
rotated_polygon = diag(1 ./ edge_normals) * repmat(transpose(polygon), length(edge_normals), 1); 

projected_polygon = real(rotated_polygon);

% the projected polygons are the rows, so take min / max across columns
intervals = [min(projected_polygon, [], 2), max(projected_polygon, [], 2)];

end
