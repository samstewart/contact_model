function transformed_polygons = affine_transforms_on_polygon(polygon, rotations, translations)
% make affine transformation matrix (last column should be the translations)
transform_matrix = zeros(length(rotations), length(rotations) + 1);
transform_matrix(:, 1:(end - 1)) = diag(rotations);
transform_matrix(:, end) = translations;

transformed_polygons = zeros(length(rotations) + 1, length(polygon));
transformed_polygons(1:length(rotations), :) = repmat(transpose(polygon), length(rotations), 1);
transformed_polygons(end, :) = 1; % need zero for an affine transform 


% where does trailing 1 go? Isn't this set supposed to be closed?
transformed_polygons = transpose(transform_matrix * transformed_polygons);

end
