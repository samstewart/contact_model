% stolen from: wet-robots.ghost.io
function w = robots_proj_point(c, a, b, p)

std_point = robots_transform_point_to_standard(c, p);

% abs puts it in the first quadrant
w = robots_proj_point_standard(b,a, abs(std_point));

w = robots_transform_point_from_standard(c, w, std_point);
end


