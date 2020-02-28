function M = quadratic_form_for_ellipse(config)
short_radius = 5;
long_radius = 6;


A = [1 0 0; 0 1 0; 0 0 -1];
translation = config(2);
translation = [1 0 real(translation); 0 1 imag(translation); 0 0 1];

scaling = [short_radius 0 0; 0 long_radius 0; 0 0 1];

rotation = config(1);
rotation = [real(rotation) -imag(rotation) 0; imag(rotation) real(rotation) 0; 0 0 1];

P = translation * rotation * scaling;
P = inv(P);

M = transpose(P) * A * P;

end
