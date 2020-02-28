function d = dist_between_ellipses(ellipse1, ellipse2, short_radius, long_radius)

e1 = @(theta) single_point_on_boundary(ellipse1, theta, short_radius, long_radius);
e2 = @(theta) single_point_on_boundary(ellipse2, theta, short_radius, long_radius);

overlap = @(theta) sign(real((e1(theta(1)) - e2(theta(2))) * conj(ellipse1(2) - ellipse2(2))));
[theta, fval] = fminsearch(@(theta) overlap(theta) * abs(e1(theta(1)) - e2(theta(2)))^2, [0 0]);
%d = sqrt(fval);
if fval < 1e-10  
	d = 0;
else
	d = sqrt(fval);
end
end
