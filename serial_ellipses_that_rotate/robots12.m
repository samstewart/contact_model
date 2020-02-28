axis(100*[-1 1 -1 1])


n = 20;
all_time = zeros(6000, n, 2);

pts = 200*rand(n,2) - 100;
all_time = zeros(
vls = .2*rand(n, 2) + .1;
angles = exp(i * rand(n,1) * 2 * pi);
%c = [1 0; exp(i * pi/3) -11 - 4i; exp(i * pi/10) 13 + 1i ];
c = [angles pts(:, 1) + i * pts(:, 2)];
h = .2
%desired_c = @(c) [0; .1 + .1i; -.1 - .2i ];
desired_c = @(c) -.5 * c(:, 2) ./ abs(c(:, 2)) 
v = desired_c(c)  ;
cla;
for l = 1:size(c, 1)
plot_ellipse(c(l, :), v(l, :));
end

all_time(1, :, :) = c;

for t = 1:6000
	cla;
	for l = 1:size(c, 1)
	v = desired_c(c);
	plot_ellipse(c(l, :), v(l, :));
	end
	drawnow;
	c(:, 2) = c(:, 2) + h * uzawa_project_ellipses(c, desired_c(c), h);
	all_time(t + 1, :, :) = c;
end
save('to_center_render.mat', 'all_time')
