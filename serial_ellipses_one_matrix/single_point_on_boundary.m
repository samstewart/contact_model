function p = single_point_on_boundary(ellipse, theta, short_radius, long_radius)
body_coords = short_radius * cos(theta) + long_radius * sin(theta) * i;

p = ellipse * [body_coords; 1];

end
