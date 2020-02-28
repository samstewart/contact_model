function [total_steps, p1, p2, n1, n2] = two_point_ellipse_dist(c1, c2)

a = 6;
b = 5;
std_ellipse = @(t)  a * cos(t) + i * b * sin(t);
std_approx_circ_center = @(t) (a^2 - b^2) * (cos(t).^3 / a - i * sin(t).^3 / b);

% note: it appears we don't need to normalize by hypot for the method to work?
std_ellipse_normal = @(t) -(b * cos(t)  + i * a * sin(t)) / hypot(a * sin(t), b * cos(t));
%std_ellipse_normal = @(t) -(b * cos(t)  + i * a * sin(t)) 

Tpoint = @(q, c) c(1)*q + c(2);
Tvec = @(q, c) c(1) * q; 

e1 = @(t) Tpoint(std_ellipse(t), c1); 
e2 = @(t) Tpoint(std_ellipse(t), c2);
n1 = @(t) Tvec(std_ellipse_normal(t), c1);
n2 = @(t) Tvec(std_ellipse_normal(t), c2);

% starting angles for collision detection
start1 = angle(c2(2) - c1(2));
start2 = start1 - pi - angle(c2(1));
start1 = start1 - angle(c1(1));

center1 = @(t) Tpoint(std_approx_circ_center(t), c1);
center2 = @(t) Tpoint(std_approx_circ_center(t), c2);

[total_steps, p1, p2, n1, n2] = signed_closest_points(e1, e2, center1, center2, @(t) abs(-a * sin(t) + i * b * cos(t)), n1, n2, start1, start2);

end
