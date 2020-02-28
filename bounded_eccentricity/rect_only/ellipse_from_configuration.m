function ellipse = ellipse_from_configuration(config)
long_radius = 5;
short_radius = 4;
n = 40;

% in body coordinates
roots = roots_of_unity(n);

% short axis aligned with x-axis, then rotated according to rotations of ellipses
ellipse = short_radius * real(roots) + long_radius * imag(roots) * i;

% transform from local into global coordinates
P = config * [ellipse; ones(1, n)];

ellipse = P(1, :);

end
