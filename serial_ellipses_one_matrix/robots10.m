axis([-20 20 -20 20])


a = 6;
b = 5;
std_ellipse = @(t)  a * cos(t) + i * b * sin(t);
std_approx_circ_center = @(t) (a^2 - b^2) * (cos(t).^3 / a - i * sin(t).^3 / b);
std_ellipse_normal = @(t) -(b * cos(t)  + i * a * sin(t)) / hypot(a * sin(t), b * cos(t));
cla
c1 = [i 1i];
c2 = [1 -15];
Tpoint = @(q, c) c(1)*q + c(2);
Tvec = @(q, c) c(1) * q; 
e1 = @(t) Tpoint(std_ellipse(t), c1); 
e2 = @(t) Tpoint(std_ellipse(t), c2);
n1 = @(t) Tvec(std_ellipse_normal(t), c1);
n2 = @(t) Tvec(std_ellipse_normal(t), c2);

center1 = @(t) T(std_approx_circ_center(t), c1);
center2 = @(t) T(std_approx_circ_center(t), c2);

plot_ellipse(e1)
plot_ellipse(e2)
%[p1, p2] = signed_closest_points(e1, e2, )
[p1, p2, n1, n2] = signed_closest_points(e1, e2, center1, center2, @(t) abs(-a * sin(t) + i * b * cos(t)), n1, n2)
ps = [p1 p1 +  n1 ];
line(real(ps), imag(ps), 'Color', 'r')

ps = [p2 p2 +  n2 ];
line(real(ps), imag(ps), 'Color', 'r')

function d = signed_distance(c1, c2, p1, p2)
	s = 1
	if inside_ellipse(c1, p2) && inside_ellipse(c2, p1)
		s = -1
	end
	d = s * abs(p1 - p2);
end

function draw_setup(t1, x,xprime, evolute, p)

m = linspace(0, 2 * pi, 100);

osc_circle = @(t) abs(evolute(t) - x(t)) * (cos(m) + i * sin(m)) + evolute(t)
line(real(x(m)), imag(x(m)))
line(real(osc_circle(t1)), imag(osc_circle(t1)), 'Color', 'r')

%line(real(evolute(m)), imag(evolute(m)))

ps = [evolute(t1) x(t1)];
line(real(ps), imag(ps))

ps = [x(t1) p];
%line(real(ps), imag(ps))

ps = [evolute(t1) p];
line(real(ps), imag(ps), 'Color', 'g')
end


