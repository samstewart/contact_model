cla
c = [1 0; exp(i * pi/10) 12 + 1i ];

% set of ellipses in a circle moving inwards
cla
n = 3
c = zeros(n, 2)
speeds = .1  + .02 * rand(1, n)
p = 7 * roots_of_unity(n)
c(:, 1) = (-p./abs(p)) % rotate to align with velocity
c(:, 2) = p;
v = speeds .* (-p./abs(p))
desired_c = @(c) transpose(v);
plot_ellipses(c, v)
h = .2

axis(20 * [-1 1 -1 1])

% what happens for three guys in a row?
cla
c = [1 -12;1 0;1 12; 1 10i]
v = [1; 0; 0; 0]
h = 1
plot_ellipses(c, v)
h * uzawa_project_ellipses(c, v, h)

% set of ellipses randomly placed
cla
n = 100 
c = zeros(n, 2);
speeds = 4  + .02 * rand(1, n);
w = 400
p = (2 *w * rand(1, n) - w) + i * (2*w * rand(1, n) - w);
c(:, 1) = (-p./abs(p)); % rotate to align with velocity
c(:, 2) = p;
plot_ellipses(c, head_towards_center(c));
h = .1
m = 3000 
history = zeros(m, size(c, 1), 2);
size(c)
c = squeeze(c)
size(history(1, :, :))
history(1, :, :) = c;
k = 4 
c(k, 2) = c(k,2) + 2
cla
plot_ellipses(c, head_towards_center(c))
c = history(m, :, :)
history(1, :, :) = history(m, :, :)

for t = 2:109
	t

% from t = 10 to t = 11 we had a problem	
% simulation only goes to t = 109
size(stateAfter)

	cla;
	t = 10
	state = squeeze(history(t - 1, :, :));
	stateAfter = zeros(n, 2);
	% t = 21 is a problem point
	cla
	plot_ellipses(squeeze(history(21, :, :)), zeros(n, 1));

	stateAfter(:,2) = state(:, 2) + h * uzawa_project_ellipses(state, head_towards_center(state), h);
	stateAfter(:, 1) = state(:, 1);
	plot_ellipses(stateAfter, zeros(n, 1));
	drawnow;

	pause(2)
%	history(t, :, 1) = state(:, 1);
%	tic
%	history(t, :, 2) = state(:, 2) + h * uzawa_project_ellipses(state, head_towards_center(state), h);
%	toc
end

% find closest point using three different methods 
complex_cross = @(z1, z2)  imag(conj(z1) * z2);
a = 6;
b = 5;
p = 10 + 10i;
std_ellipse = @(t)  a * cos(t) + i * b * sin(t);
tangent = @(t)  -a * sin(t) + i * b * cos(t);
evolute = @(t) (a^2 - b^2) * (cos(t).^3 / a - i * sin(t).^3 / b);
evolute_prime = @(t) (a^2 - b^2) * 3 * (cos(t).^2 .* (-sin(t)) / a - i * 3 * sin(t).^2  .* cos(t) / b);
normal = @(t) (b * cos(t)  + i * a * sin(t)) 
normal_prime = @(t) i * std_ellipse(t) 
Tpoint = @(q, c) c(1)*q + c(2);
Tvec = @(q, c) c(1) * q; 
m = 10
dt_evolute = zeros(1, m)
dt_not_evolute = zeros(1, m)
dt_old_evolute = zeros(1, m)
std_ellipse = @(t)  a * cos(t) + i * b * sin(t);
std_approx_circ_center = @(t) (a^2 - b^2) * (cos(t).^3 / a - i * sin(t).^3 / b);
std_ellipse_normal = @(t) -(b * cos(t)  + i * a * sin(t)) / hypot(a * sin(t), b * cos(t));
inf_arc_length = @(t) abs(-a * sin(t) + i * b * cos(t))
c = [1 0]

% compare the three methods

% compute newtons method with evolute helping
legend('off')
t1 = pi /2
for k = 1:size(dt_evolute, 2)
	k
	cla
	% plot ellipse
	ps = Tpoint(std_ellipse(linspace(0, 2*pi, 100)), c);
	line(real(ps), imag(ps));	
	% plot normal
	e1 = Tpoint(std_ellipse(t1),c) ;
	n1 = Tvec(normal(t1), c);
	ps = [e1 e1 + n1];
	line(real(ps), imag(ps));	
	% plot normal derivative
	e1 = Tpoint(std_ellipse(t1),c) ;
	n1 = Tvec(normal_prime(t1), c);
	ps = [e1 e1 + n1];
	line(real(ps), imag(ps));	
	% plot line to point
	ps = [e1 p];
	line(real(ps), imag(ps), 'Color', 'r');	
	dt = complex_cross(normal(t1), p - evolute(t1)) / complex_cross(normal_prime(t1), p - evolute(t1)) 
	dt_evolute(k) = dt;
	t1 = t1 - dt 
	pause(1)
	drawnow;
end

% compute newtons method with no evolute
t1 = pi /2
for k = 1:size(dt_not_evolute, 2)
	k
	cla
	% plot ellipse
	ps = Tpoint(std_ellipse(linspace(0, 2*pi, 100)), c);
	line(real(ps), imag(ps));	
	% plot normal
	e1 = Tpoint(std_ellipse(t1),c) ;
	n1 = Tvec(normal(t1), c);
	ps = [e1 e1 + n1];
	line(real(ps), imag(ps));	
	% plot normal derivative
	e1 = Tpoint(std_ellipse(t1),c) ;
	n1 = Tvec(normal_prime(t1), c);
	ps = [e1 e1 + n1];
	line(real(ps), imag(ps));	
	% plot line to point
	ps = [e1 p];
	line(real(ps), imag(ps), 'Color', 'r');	
	dt = complex_cross(normal(t1), p - std_ellipse(t1)) /( complex_cross(normal_prime(t1), p - std_ellipse(t1))  - complex_cross(normal(t1), tangent(t1)))
	dt_not_evolute(k) = dt;
	t1 = t1 - dt 
	pause(1)
	drawnow;
end

% compute with geometric argument from wetrobots post
t1 = pi /2
for k = 1:size(dt_old_evolute, 2)
	k
	cla
	% plot ellipse
	ps = Tpoint(std_ellipse(linspace(0, 2*pi, 100)), c);
	line(real(ps), imag(ps));	
	% plot normal
	e1 = Tpoint(std_ellipse(t1),c) ;
	n1 = Tvec(normal(t1), c);
	ps = [e1 e1 + n1];
	line(real(ps), imag(ps));	
	% plot normal derivative
	e1 = Tpoint(std_ellipse(t1),c) ;
	n1 = Tvec(normal_prime(t1), c);
	ps = [e1 e1 + n1];
	line(real(ps), imag(ps));	
	% plot line to point
	ps = [e1 p];
	line(real(ps), imag(ps), 'Color', 'r');	
	dt = compute_delta_t(t1, std_ellipse, inf_arc_length, std_approx_circ_center, p)
	dt_old_evolute(k) = dt;
	t1 = t1 + dt 
	pause(1)
	drawnow;
end
hold on
cla
plot(1:10, log10(abs(dt_old_evolute(1:10))))
plot(1:10, log10(abs(dt_evolute(1:10))))
plot(1:10, log10(abs(dt_not_evolute(1:10))))
legend('gradient', 'newton evolute', 'newton')
hold off

% find closest points on two ellipses
dt_evolute = zeros(1, m)
dt_not_evolute = zeros(1, m)
dt_old_evolute = zeros(1, m)


% newtons method with evolute
legend('off')

evolute_prime = @(t) (a^2 - b^2) * 3 * (cos(t).^2 .* (-sin(t)) / a - i * 3 * sin(t).^2  .* cos(t) / b);
c1 = [1 0];
c2 = [1 13 + 13i]
n1 = @(t) Tvec(normal(t), c1)
n2 = @(t) Tvec(normal(t), c2)
x1 = @(t) Tpoint(evolute(t), c1)
x2 = @(t) Tpoint(evolute(t), c2)
x1p = @(t) Tpoint(evolute_prime(t), c1)
x2p = @(t) Tpoint(evolute_prime(t), c2)
n1p = @(t) Tvec(normal_prime(t), c1)
n2p = @(t) Tvec(normal_prime(t), c2)
e1 = @(t) Tpoint(std_ellipse(t), c1)
e2 = @(t) Tpoint(std_ellipse(t), c2)
cr = complex_cross
F = @(t) [cr(n1(t(1)), x2(t(2)) - x1(t(1))); cr(n2(t(2)), x2(t(2)) - x1(t(1)))]
axis(20*[-1 1 -1 1])

% three main methods:
% 1) wetrobots blog post
% 2) newtons method to find zeos of n(t) x (x2(t) - x1(t)) where x1,x2 are centers of the osculating circles at t. (we are taking the cross product)
% 3) newtons method to find zeos of n(t) x (x2 - x1) where x1,x2 are not the centers of the osculating circles but instead the corresponding points on the boundary of the ellipse
% test newtons method with evolute
t = [pi/3; pi + pi/4]
for k = 1:size(dt_evolute, 2)
	cla
	% ellipse 1
	% plot ellipse
	ps = e1(linspace(0, 2*pi, 100));
	line(real(ps), imag(ps));	
	% plot normal
	ps = [e1(t(1)) e1(t(1)) + n1(t(1))];
	line(real(ps), imag(ps));	
	% ellipse 2
	% plot ellipse
	ps = e2(linspace(0, 2*pi, 100));
	line(real(ps), imag(ps));	
	% plot normal
	ps = [e2(t(2)) e2(t(2)) + n2(t(2))];
	line(real(ps), imag(ps));	
	% line between them 
	ps = [e1(t(1)) e2(t(2))];
	line(real(ps), imag(ps), 'Color', 'r');	
%	t = t + [.1; .1];
	% differentiatals
	nablaF = zeros(2,2);
	nablaF(1,1) = cr(n1p(t(1)), x2(t(2)) - x1(t(1)));
	nablaF(2,2) = cr(n2p(t(2)), x2(t(2)) - x1(t(1)));
	nablaF(1,2) = cr(n1(t(1)), x2p(t(2)));
	nablaF(2,1) = -cr(n2(t(2)), x1p(t(1)));
	dt = inv(nablaF) * F(t)
	t = t - dt;
	dt_evolute(k) = sum(abs(dt));
	pause(1)
	drawnow;
end

evolute_prime = @(t) (a^2 - b^2) * 3 * (cos(t).^2 .* (-sin(t)) / a - i * 3 * sin(t).^2  .* cos(t) / b);
c1 = [1 0];
c2 = [1 13 + 13i]
n1 = @(t) Tvec(normal(t), c1)
n2 = @(t) Tvec(normal(t), c2)
x1 = @(t) Tpoint(std_ellipse(t), c1)
x2 = @(t) Tpoint(std_ellipse(t), c2)
x1p = @(t) Tpoint(tangent(t), c1)
x2p = @(t) Tpoint(tangent(t), c2)
n1p = @(t) Tvec(normal_prime(t), c1)
n2p = @(t) Tvec(normal_prime(t), c2)
e1 = @(t) Tpoint(std_ellipse(t), c1)
e2 = @(t) Tpoint(std_ellipse(t), c2)
cr = complex_cross
F = @(t) [cr(n1(t(1)), x2(t(2)) - x1(t(1))); cr(n2(t(2)), x2(t(2)) - x1(t(1)))]

% test newtons method with no evolute 
t = [pi/3; pi + pi/4]
for k = 1:size(dt_evolute, 2)
	cla
	% ellipse 1
	% plot ellipse
	ps = e1(linspace(0, 2*pi, 100));
	line(real(ps), imag(ps));	
	% plot normal
	ps = [e1(t(1)) e1(t(1)) + n1(t(1))];
	line(real(ps), imag(ps));	
	% ellipse 2
	% plot ellipse
	ps = e2(linspace(0, 2*pi, 100));
	line(real(ps), imag(ps));	
	% plot normal
	ps = [e2(t(2)) e2(t(2)) + n2(t(2))];
	line(real(ps), imag(ps));	
	% line between them 
	ps = [e1(t(1)) e2(t(2))];
	line(real(ps), imag(ps), 'Color', 'r');	
%	t = t + [.1; .1];
	% differentiatals
	nablaF = zeros(2,2);
	nablaF(1,1) = cr(n1p(t(1)), x2(t(2)) - x1(t(1))) - cr(n1(t(1)), x1p(t(1)));
	nablaF(2,2) = cr(n2p(t(2)), x2(t(2)) - x1(t(1))) + cr(n2(t(2)), x2p(t(2)));
	nablaF(1,2) = cr(n1(t(1)), x2p(t(2)));
	nablaF(2,1) = -cr(n2(t(2)), x1p(t(1)));
	dt = inv(nablaF) * F(t)
	t = t - dt;
	dt_not_evolute(k) = sum(abs(dt));
	pause(1)
	drawnow;
end
angle(c1(1))

cla
%c1 = [1 0];
%c2 = [exp(i * pi/3) 18 + 9i];
n1 = @(t) Tvec(normal(t), c1)
n2 = @(t) Tvec(normal(t), c2)
evolute_prime = @(t) (a^2 - b^2) * 3 * (cos(t).^2 .* (-sin(t)) / a - i * 3 * sin(t).^2  .* cos(t) / b);
x1 = @(t) Tpoint(evolute(t), c1)
x2 = @(t) Tpoint(evolute(t), c2)
e1 = @(t) Tpoint(std_ellipse(t), c1)
e2 = @(t) Tpoint(std_ellipse(t), c2)
cr = complex_cross
legend('off')
% test graphical method from wetrobots 
t = [3*pi/4; pi + pi/4]
theta1 = angle(c2(2) - c1(2))
theta2 = theta1 - pi - angle(c2(1))
theta1 = theta1 - angle(c1(1))
t = [theta1; theta2] 
plot_ellipses([c1; c2], [0; 0])
ps = [e1(t(1)) e1(t(1)) + n1(t(1))];
line(real(ps), imag(ps));	
% plot normal 2
ps = [e2(t(2)) e2(t(2)) + n2(t(2))];
line(real(ps), imag(ps));	
ps = [c1(2) c2(2)];
line(real(ps), imag(ps), 'Color', 'r');	

for k = 1:size(dt_evolute, 2)
	cla
	plot_ellipses([c1; c2], [0; 0])
	% plot normal 1
	ps = [e1(t(1)) e1(t(1)) + n1(t(1))];
	line(real(ps), imag(ps));	
	% plot normal 2
	ps = [e2(t(2)) e2(t(2)) + n2(t(2))];
	line(real(ps), imag(ps));	
	% line between them 
	ps = [e1(t(1)) e2(t(2))];
	line(real(ps), imag(ps), 'Color', 'r');	
%	t = t + [.1; .1];
	% differentiatals
	dt = zeros(2, 1);
	dt(1) = compute_delta_t(t(1), e1, inf_arc_length, x1, x2(t(2)));
	dt(2) = compute_delta_t(t(2), e2, inf_arc_length, x2, x1(t(1)));
	t = t + dt;
	err = sum(abs(dt))
	if err < 1e-15
		k
	end
	dt_old_evolute(k) = err;
	pause(1)
	drawnow;
end


hold on
xlabel 'steps'
ylabel 'error'
cla
plot(1:20, log10(abs(dt_old_evolute(1:20))))
plot(1:20, log10(abs(dt_evolute(1:20))))
plot(1:20, log10(abs(dt_not_evolute(1:20))))
legend('gradient', 'newton evolute', 'newton')
hold off


