function ps = points_on_boundary_in_interval(ellipses, thetas)
short_radius = 5;
%long_radius = 6;
long_radius = 6;
m = length(thetas);
% distort roots of unity into an ellipse
% center the interval at theta_0
roots = exp(i * thetas);

% short axis aligned with x-axis, then rotated according to rotations of ellipses
roots = short_radius * real(roots) + long_radius * imag(roots) * i;

% the ellipses are represented as affine transformations, so we need 1
roots = [roots; ones(1, m)];

ps = ellipses * roots;


end
