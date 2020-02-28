cla
c = [1 0; exp(i * pi/10) 12 + 1i ];
axis(20 * [-1 1 -1 1])

% playing with rotational normal vectors 
cla;
c1 = [1 0];
c2 = [1 11-.5 + 5i ];
%c2(1) = exp(2 * pi / 10 * i)
c = [c1; c2];
plot_ellipses(c, [0; 0])

cla
c2(1) = exp(2 * pi / 43 *i)
plot_ellipses([c1; c2], [0; 0])

% the robustness of the numerical method will depend on the taylor approximation to the constraint set. a first order approximation will be decent only in a very small neigbhorhood of (x, \theta) due to the nonlinearity of the dependence of the distance on the rotation?

% try to compute the projection using the rotation parameter
% the symmetry of the normal cone / gradient comes from the symmetry of the distance function.
% I still don't understand why the algorithm splits the initial velocity 
cla

c1
[normals, dist] = normals_and_distances_ellipses([c1; c2], 100, 100)


% I want to penalize rotations. So when we compute argmin_C |v - v_0|^2 + |theta - theta_0|^2 I gues I should weight the theta term? What did the French guys mean when they said it's not homogenous? We need a good norm on the affine transformations?
axis(20 * [-1 1 -1 1])
cla
c = [1 -5 - 9.5i; 1 0; 1 11-.5 + 5i ];
v_prime = zeros(6, 1);
%v_prime(1) = -.05i + .03
%v_prime(5) = -.1 - .1i;


v_prime = v;
%net_rot = 0;
%net_trans = 0;
% why do the projected translational velocities sum to the original sum of translational velocities and likewise for the rotational velocities
max_t = 600;
history = zeros(max_t, size(c, 1), 2);
history = [history; zeros(max_t, size(c, 1), 2)]

%history(1, :, :) = c;
for t = (2*max_t+1):size(history, 1)
c = squeeze(history(t - 1, :, :));
cla
h = 1;
rho = .2;
max_vel = max(abs(v_prime));
v = project_all(v_prime, c, 8, 6, max_vel, h, rho);
%net_trans = net_trans + abs(v(3));
%net_rot = net_rot + abs(v(4));
% note the ordering is a bit confusing. the velocity and the configurations are out of sync (rotation then translation). maybe fix this?
c(:, 2) = c(:, 2) + v(1:2:end);
c(:, 1) = c(:, 1) .* exp(v(2:2:end) * i);
plot_ellipses(c, v_prime)
history(t, :, :) = c;
drawnow;
end
%net_trans
%net_rot

axis(10 * [-1 1 -1 1])

plot(distances)

distances = zeros(100, 1)
lambdas = linspace(0, 10, 100)
for k = 1:length(lambdas) 
lambda = lambdas(k)
c1 = [1 0];
c2 = [1 11-.6 + 5i ];
%c2 = [1 10i]
[total_steps, p1, p2, n1, n2] = two_point_ellipse_dist(c1, c2)
rn1 = -complex_cross(p1 - c1(2), n1);
rn2 = -complex_cross(p2 - c2(2), n2);
constraint_normals = [n1; rn1; n2; rn2];
v = lambda * constraint_normals

v = v_cur
cla
c1(2) = c1(2) + v(1);
c1(1) = c1(1) * exp(v(2) * i)
c2(2) = c2(2) + v(3);
c2(1) = c2(1) * exp(v(4) * i)
plot_ellipses([c1; c2], [0; 0])

[total_steps, p1, p2, n1, n2] = two_point_ellipse_dist(c1, c2);
distances(k) = signed_ellipse_dist(c1, c2, p1, p2);
plot_ellipses([c1; c2], [0; 0])
drawnow
%pause(1)
pause(.1)
end

% shows distance function and its derivative with respect to angle. appears to be a smooth function.
theta = linspace(0, 4*pi, 200);
distances = zeros(1, length(theta));
derivatives = zeros(1, length(theta))
for k = 1:length(theta)
	c2(1) = exp(theta(k) * i);
	[total_steps, p1, p2, n1, n2] = two_point_ellipse_dist(c1, c2);
	distances(k) = abs(p1 - p2);
	derivatives(k) = complex_cross(p2 - c2(2), n2);
end
hold on
plot(theta, distances)
plot(theta, derivatives)
hold off

abs(p1 - p2)
t2 = i*n2;
rn2 = complex_cross(p2 - c2(2), n2)  
ps = [p2 p2 + 2*rn2*t2];
line(real(ps), imag(ps), 'Color', 'r')
ps = [p1 p2]
line(real(ps), imag(ps))

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
c = [1 -12;1 0;1 12]
v = [1; 0; 0]
h = 1
plot_ellipses(c, v)
h * uzawa_project_ellipses(c, v, h, 6, 1)

% opposite sides like a football team (check lane formation) 
cla
[x, y] = meshgrid(0:5, 0:5);
n = 2*size(x, 1)^2;
c = zeros(n, 2);
p1 = 2*6 * x + 5*2*y*i;
p1 = reshape(p1, [size(x, 1)^2 1]);
p1 = p1 - 67 - 25i ;
p2 = -real(p1) + imag(p1) * i + 3i;
v = zeros(2 * n, 1);
v(1:2:end) =[(.1 + .1*rand(n/2, 1)); -(.1 + .1*rand(n/2, 1))];
v(2:2:end) = 0; % no preferred rotational velocity
max_vel = max(abs(v));
c(:, 1) = 1;
c(:, 2) = [p1; p2];
cla
plot_ellipses(c, v);
axis(100 *[-1 1 -1 1])

% arrange in a circle
target = circshift(p, floor(n/2)); % point at antipodal guy
speeds  = (3 + randn(n, 1)); 
max_vel = max(speeds)
c(:, 1) = (-target./abs(target)); % rotate to align with velocity
c(:, 2) = p;
plot_ellipses(c, head_towards_target(c, target, speeds));


% arranged in circle trying to go to opposite sides 
cla
n = 30 
radius = 90
c = zeros(n, 2);
p = transpose(radius * exp(i * 2 * pi / n * linspace(0, n-1, n)) );
target = circshift(p, floor(n/2)); % point at antipodal guy
speeds  = (3 + randn(n, 1)); 
max_vel = max(speeds)
c(:, 1) = (-target./abs(target)); % rotate to align with velocity
c(:, 2) = p;
plot_ellipses(c, head_towards_target(c, target, speeds));

head_towards_center([1 1; -5 1])

% set of ellipses randomly placed
cla
n = 100;
c = zeros(n, 2);
w = 400;
p = (2 *w * rand(1, n) - w) + i * (2*w * rand(1, n) - w);
c(:, 1) = (-p./abs(p)); % rotate to align with velocity
c(:, 2) = p;
plot_ellipses(c, head_towards_center(c));

h = .1
m = 3000 
history = zeros(m, size(c, 1), 2);
history(1, :, :) = c;

plot_ellipses(c, head_towards_center(c))

k = 4 
c(k, 2) = c(k,2) + 2
cla
plot_ellipses(c, head_towards_center(c))
c = history(m, :, :)
history(1, :, :) = history(m, :, :)

% todo: there should be only 1 step when no overlap?
rho = 34;
t = 2
state = squeeze(history(t - 1, :, :));
v = head_towards_target(state, target, speeds)
h * uzawa_project_ellipses(state, v, h, 6, 3, rho);
plot_ellipses(state, v)

history(1, :, :) = history(70, :, :)

save('football.mat', 'history')

% create figure for thesis
load('football.mat', 'history')
n = size(history, 2)

t = [2 300 1400 1800]
for i = 1:4
axis(150*[-1 1 -1 1])
subplot(2,2, i);
set(gca, 'xtick', [], 'ytick', [])
state = squeeze(history(t(i) - 1, :, :));
cla
plot_ellipses(state, zeros(2*n, 1));
end

subplot(4,4, 2);
state = squeeze(history(t2 - 1, :, :));
plot_ellipses(state, zeros(2*n, 1));

subplot(4,4, 3);
state = squeeze(history(t3 - 1, :, :));
plot_ellipses(state, zeros(2*n, 1));

subplot(4,4, 4);
state = squeeze(history(t4 - 1, :, :));
plot_ellipses(state, zeros(2*n, 1));



% last simulation left at t = 1209
v = VideoWriter('ellipse_with_rotate.avi')
v.Quality = 25; % much better file sizes!
v.FrameRate = 24;
open(v)
set(gca, 'nextplot', 'replacechildren');
%while t <= m
for t = 2:10:3*max_t
	t
	cla;
	state = squeeze(history(t - 1, :, :));
%	stateAfter(:, 1) = state(:, 1);
%	v = head_towards_target(state, target, speeds);
%	stateAfter(:,2) = state(:, 2) + h * uzawa_project_ellipses(state, v, h, 6, max_vel, rho);
%	plot_ellipses(stateAfter, v);
%	history(t, :, :) = stateAfter;
	plot_ellipses(state, zeros(2*n, 1));
	%pause(.04)
	writeVideo(v, getframe(gca)); 
	drawnow;
	t = t + 1;
end

close(v)

cla
unit = exp(i * (0:.1:(2*pi)));
ellipse = 7 * real(unit) + 5 * i * imag(unit);
line(real(ellipse), imag(ellipse))

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
axis(400*[-1 1 -1 1])

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


