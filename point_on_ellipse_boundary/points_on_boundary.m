function ps = points_on_boundary(ellipses, short_radius, long_radius, n)
% I guess that we're actually work on CP^2? I'm not sure that means anything here.

% distort roots of unity into an ellipse
roots = roots_of_unity(n);

% short axis aligned with x-axis, then rotated according to rotations of ellipses
roots = short_radius * real(roots) + long_radius * imag(roots) * i;

% the ellipses are represented as affine transformations, so we need 1
roots = [roots; ones(1, n)];

% this line a little fancy: we are translating and rotating the roots to position the ellipses in space.
% todo: maybe this is too fancy and makes the code kind of unreadable?
ps = ellipses * roots;

end
