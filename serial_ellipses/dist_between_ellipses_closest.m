function d = dist_between_ellipses_closest(e1, e2, theta1, theta2)
short = 5;
long = 6;

p1 = exp(i * theta1);
p2 = exp(i * theta2);

p1 = short * real(p1) + i * long * imag(p1);
p2 = short * real(p2) + i * long * imag(p2);

% map into world space
p1 = e1 * [p1; 1];
p2 = e2 * [p2; 1];

% will be negative if the ellipses overlap
overlap = sign(complex_dot(e1(2) - e2(2), p1 - p2));
d = overlap * abs(p1 - p2);
end
