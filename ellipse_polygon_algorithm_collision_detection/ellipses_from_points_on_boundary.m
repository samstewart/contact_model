function ellipses = ellipses_from_points_on_boundary(points, short_radius, long_radius)
% This is the inverse of points_on_boundary. Another way to see this is that we recover the transformation from the points.
% Columns are points on the boundaries of a single of list. so the mean is the center of mass.
centers = transpose(mean(points, 1));  

% 1 is rotated to align with the short radius. So the vector from the center to the first point on the boundary is the angle of rotation (as a complex number)
rotations = (transpose(points(1, :)) - centers) / short_radius; 

ellipses = [rotations centers];
end
