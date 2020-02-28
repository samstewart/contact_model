clear n2
axis([-100 100 -100 100])
%[p1, p2, n1, n2] = robots_two_point_ellipse_dist(6, 5, [1 0], [1 10])
%n = normal_to_ellipse([1 0], 6, 5, pi/2)
%n3 = robots_transform_vector_from_standard([1 10.1], normal_to_ellipse([1 0], 6, 5, pi/2), [0 -5.100])
%[n, d] = normals_and_distances_ellipses([1 0; 1 10; 1 20])
% todo: we need a new way to compute the normal when the ellipses are touching
C = zeros(18, 2);
C(1:6, :) = [1 0; exp(i * pi/10) 13 + 1i; 1 10i; 1 -12i; 1 -12; 1 15 + 15i];
C(7:12, 1) = 1;
C(7:12, 2) = C(1:6, 2) + 50;

C(13:18, 1) = 1;
C(13:18, 2) = C(1:6, 2) - 50;


V = zeros(18, 1);
V(1:6) = [0; -.1 - .2i; -.1i; .04i; .2; -.1 - .2i];
V(7:12) = V(1:6);
V(13:18) = V(1:6);
h = .2
desired_c = @(c) V;
for t = 1:200
	cla;

	for l = 1:size(C, 1)
		plot_ellipse(C(l, :));
	end
	t
	drawnow;
	C(:, 2) = C(:, 2) + h * uzawa_project_ellipses(C, desired_c(C), h);
end
