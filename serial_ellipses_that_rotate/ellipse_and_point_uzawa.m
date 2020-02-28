axis([-20 20 -20 20])
%[p1, p2, n1, n2] = robots_two_point_ellipse_dist(6, 5, [1 0], [1 10])
%n = normal_to_ellipse([1 0], 6, 5, pi/2)
%n3 = robots_transform_vector_from_standard([1 10.1], normal_to_ellipse([1 0], 6, 5, pi/2), [0 -5.100])
%[n, d] = normals_and_distances_ellipses([1 0; 1 10; 1 20])
% todo: we need a new way to compute the normal when the ellipses are touching

h = .2
v = .1;
c = [1 0];
p = 6 + 3i;
%[n1, p1] = one_point_dist([1 0], p)
%signed_distance_to_one_point(c, p1, p)
pi/100
up1(c, p, [.1; pi/100], h)
return
for t = 1:200
	cla;

	plot_ellipse(c);
	plot_point(p)
	drawnow;
	v1 = up1(c, p, v, h)
	c(2) = c(2) + h * up1(c, p, v, h);
%	c(2) = c(2) + h * v;
%	q = q + h * v;
end
function d = signed_distance_to_one_point(c, p1, p)
	s = 1;
	if inside_ellipse(c, p) 
		s = -1;
	end
	d = s * abs(p1 - p);
end


function [n1, p1] = one_point_dist(c, p)

a = 6;
b = 5;
std_ellipse = @(t)  a * cos(t) + i * b * sin(t);
std_approx_circ_center = @(t) (a^2 - b^2) * (cos(t).^3 / a - i * sin(t).^3 / b);

std_ellipse_normal = @(t) -(b * cos(t)  + i * a * sin(t)) / hypot(a * sin(t), b * cos(t));

Tpoint = @(q, c) c(1)*q + c(2);
Tvec = @(q, c) c(1) * q; 

e1 = @(t) Tpoint(std_ellipse(t), c); 
n1 = @(t) Tvec(std_ellipse_normal(t), c);
center1 = @(t) Tpoint(std_approx_circ_center(t), c);
inf_arc_length = @(t) abs(-a * sin(t) + i * b * cos(t));

t1 = pi/4;

for m = 1:5

delta_t1 = compute_delta_t(t1, e1, inf_arc_length, center1, p);
t1 = t1 + delta_t1;
%pause(2)
end

p1 = e1(t1);
n1 = n1(t1);

 
end

function [v_cur, lambda] = up1(c, p, v_prime, h)

lambda = 0;

v_cur = 0;
v_last = 0; 
error_k = Inf;

complex_cross = @(z1, z2)  imag(conj(z1) * z2);
[B, p1] = one_point_dist(c, p);
B = [B; complex_cross(c(2) - p1, B)]
signed_distances = signed_distance_to_one_point(c, p1, p);

B = -h * B; % columns are normal vectors that span normal cone at q
total_steps = 0;;

while error_k > 1e-5
	v_last = v_cur;
	
	project_desired_vel = @(lambda) v_prime - B * lambda;
	% we embedded the real problem into the complex one, so the real/conj nonsense is to project back. Note that the transpose is conjugate transpose, that's importnat
	compute_lambda = @(v_new) real(B' * v_new) - signed_distances;
	
	% todo: how to choose rho?
	[v_cur, lambda] = uzawa(lambda, project_desired_vel, compute_lambda, .3);
	error_k = sum(abs(v_cur - v_last));
	total_steps = total_steps + 1; 
end	

end

