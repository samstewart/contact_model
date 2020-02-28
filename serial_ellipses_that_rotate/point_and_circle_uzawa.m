
clear n2
axis([-20 20 -20 20])
%[p1, p2, n1, n2] = robots_two_point_ellipse_dist(6, 5, [1 0], [1 10])
%n = normal_to_ellipse([1 0], 6, 5, pi/2)
%n3 = robots_transform_vector_from_standard([1 10.1], normal_to_ellipse([1 0], 6, 5, pi/2), [0 -5.100])
%[n, d] = normals_and_distances_ellipses([1 0; 1 10; 1 20])
% todo: we need a new way to compute the normal when the ellipses are touching

h = .2
v = .1 + .1i;
q = 0;
p = 6;
R = 5;

up(0, 5, .1, 5, .2)
return
for t = 1:200
	cla;

	plot_circle(q, R);
	ps = [p - 1i p + 1i];
	line(real(ps), imag(ps));
	ps = [p - 1 p + 1];
	line(real(ps), imag(ps));
	
	drawnow;
	q = q + h * up(q, p, v, R, h);
%	q = q + h * v;
end


function [v_cur, lambda] = up(q, p, v_prime, R, h)

lambda = 0;

v_cur = 0;
v_last = 0; 
error_k = Inf;


B = (q - p)/abs(q - p);
B = -h * B; % columns are normal vectors that span normal cone at q
signed_distances = abs(p - q) - R ;
total_steps = 0;;

while error_k > 1e-5
	v_last = v_cur;
	
	solve_unconstrained = @(lambda) v_prime - B * lambda;
	% we embedded the real problem into the complex one, so the real/conj nonsense is to project back. Note that the transpose is conjugate transpose, that's importnat
	constraint_gradient = @(v_new) real(B' * v_new) - signed_distances;
	
	% todo: how to choose rho?
	[v_cur, lambda] = uzawa(lambda, solve_unconstrained, constraint_gradient, .3);
	error_k = sum(abs(v_cur - v_last));
	total_steps = total_steps + 1; 
end	

total_steps;

end

