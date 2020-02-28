function u = unit_normal_to_ellipse(config, theta, short, long)
tangent = -short*sin(theta) + i * long * cos(theta);

u = -i * tangent; % equation for normal vector (just distorted from a circle, can rederive with the gradient to the level set)

% by definition of an ellipse, u will be a unit vector when u is on the ellipse
u = config(1) * u; % rotate to match actual configuration

u = u / abs(u);

end
