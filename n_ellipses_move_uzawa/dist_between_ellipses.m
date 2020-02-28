function [theta1, theta2, normal, d] = dist_between_ellipses(ellipses, short_radius, long_radius)
n = size(ellipses, 1);
N = n * (n - 1) / 2;
theta1 = zeros(N, 1);
theta2 = zeros(N, 1);
normal = zeros(N, 1);
d = zeros(N, 1);

m = 1;
for j = 1:n
       for k = 1:n	
	       if k > j
		       [t1, t2, dm] = dist_between_two_ellipses(ellipses(j, :), ellipses(k, :), short_radius, long_radius);

		       theta1(m) = t1;
		       theta2(m) = t2; 
		       normal(m) = unit_normal_to_ellipse(ellipses(j), t1, short_radius, long_radius)/2;
		       d(m) = dm;
		       m = m + 1;
	       end
       end
end
end
