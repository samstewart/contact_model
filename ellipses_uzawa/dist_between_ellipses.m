function [theta1, theta2, d] = dist_between_ellipses(ellipse1, ellipse2, short_radius, long_radius)

e1 = @(theta) single_point_on_boundary(ellipse1, theta, short_radius, long_radius);
e2 = @(theta) single_point_on_boundary(ellipse2, theta, short_radius, long_radius);

[theta, fval] = fminsearch(@(theta) abs(e1(theta(1)) - e2(theta(2)))^2, [0 0]);
theta1 = theta(1);
theta2 = theta(2);
d = sqrt(fval);
end
