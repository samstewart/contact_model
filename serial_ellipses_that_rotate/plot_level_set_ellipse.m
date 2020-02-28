function plot_level_set_ellipse(config)
n = 50;
x = linspace(-20, 20, n);
y = linspace(-20, 20, n);

z = zeros(n);
[X,Y] = meshgrid(x,y);
M = quadratic_form_for_ellipse(config);

for k = 1:length(x)
	for l = 1:length(y)
		p = [x(k) y(l) 1]';
		z(l, k) = p' * M * p; 
	end
end

contour(X, Y, z, [0 0]);

end
