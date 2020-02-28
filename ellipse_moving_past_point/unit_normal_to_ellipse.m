function u = unit_normal_to_ellipse(config, short, long, q)


q = real_to_complex_vector(q);
q = q - config(2); % put in local coordinates 
q = i * q; % align long axis with real axis

u = real(q) / long + i * imag(q) / short; % equation for normal vector (just distorted from a circle, can rederive with the gradient to the level set)

% by definition of an ellipse, u will be a unit vector when u is on the ellipse
u = -i * config(1) * u; % rotate to match actual configuration

u = complex_to_real_vector(u);

end
