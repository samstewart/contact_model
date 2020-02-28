function tests = test2Test
tests = functiontests(localfunctions);
end

function testMakingEdgePoints(tc)
fatalAssertEqual(tc, points_on_boundary_in_interval([1 0], 0, pi/2, 1), [-6i 5 6i], 'AbsTol', 1e-15)
fatalAssertEqual(tc, points_on_boundary_in_interval([i 0], 0, pi/2, 1), [6 5i -6], 'AbsTol', 1e-15)
fatalAssertEqual(tc, points_on_boundary_in_interval([-1 0], 0, pi/2, 1), [6i -5 -6i], 'AbsTol', 1e-15)
fatalAssertEqual(tc, points_on_boundary_in_interval([1 0], pi/2, pi/2, 1), [5 6i -5], 'AbsTol', 1e-15)

% test rotation
p = exp(i * pi/4);
short_axis = 5;
long_axis = 6;
p = short_axis * real(p) + long_axis * i * imag(p);
p = i * p;
ps = points_on_boundary_in_interval([i 0], pi/4, pi/4, 1);

fatalAssertEqual(tc, points_on_boundary_in_interval([i 0], pi/4, pi/4, 1), [5i p -6], 'AbsTol', 1e-14)
fatalAssertEqual(tc, points_on_boundary_in_interval([i 0], 3*pi/2, pi/2, 1), [-5i 6 5i], 'AbsTol', 1e-14)
%fatalAssertEqual(tc, points_on_boundary_near_point([i 0], pi/2, pi/2, 1), [-5i -6 5i], 'AbsTol', 1e-14)

end

function testTouching(tc)

fatalAssertEqual(tc, replace_row([1 1; 1 2], 2, [3 4]), [1 1; 3 4])


fatalAssertEqual(tc, complex_dot(1 + 1i, 2 + 2i), 4)
fatalAssertEqual(tc, complex_dot(0, 2 + 2i), 0)
fatalAssertEqual(tc, complex_dot(1 + 1i, 0), 0)
fatalAssertEqual(tc, signed_dist_between_points_on_ellipses([1 0], [1 10], 5, 5), 0)
fatalAssertEqual(tc, signed_dist_between_points_on_ellipses([1 0], [1 9.9], 5, 4.9), -.1, 'AbsTol', 1e-14)

% when they overlap, the distance should be negative
[m1, m2, d] = edge_points_dist_between_ellipses([1 0], [1 10], 0, 0, pi, 600);
fatalAssertEqual(tc, [m1 m2 d], [0 -pi 0])


[m1, m2, d] = edge_points_dist_between_ellipses([1 0], [1 10], 0, pi, pi/50, 30);
fatalAssertEqual(tc, [m1 m2 d], [0 pi 0])

[m1, m2, d] = edge_points_dist_between_ellipses([1 0], [1 11], 0, pi, pi/50, 30);
fatalAssertEqual(tc, [m1 m2 d], [0 pi 1])

[m1, m2, d] = edge_points_dist_between_ellipses([1 0], [1 10], 0, pi - pi/50, pi/50, 30);
fatalAssertEqual(tc, [m1 m2 d], [0 pi 0])

[m1, m2, d] = edge_points_dist_between_ellipses([1 0], [1 9.9], 0, pi - pi/50, pi/50, 30);
fatalAssertLessThan(tc, d, 0)

[m1, m2, d] = edge_points_dist_between_ellipses([i 0], [i 20], -pi/2, pi/2, pi/50, 30);
fatalAssertEqual(tc, [m1 m2 d], [-pi/2 pi/2 20 - 6*2])

[closest_angles, closest_distances] = update_closest([1 0; 1 11], [0 0; (pi - pi/50) 0]);

fatalAssertEqual(tc, modify_m([1 0; 1 0]), [1 Inf; 1 0])
fatalAssertEqual(tc, closest_angles, [0 0; pi 0], 'AbsTol', 1e-14);
fatalAssertEqual(tc, closest_distances, [0 1; 1 0], 'AbsTol', 1e-14);

fatalAssertEqual(tc, ellipse_distance_to_point([1 0], 10), 5, 'AbsTol', 1e-14);
fatalAssertLessThan(tc, ellipse_distance_to_point([1 0], 4.9), 0);

cs = neighborhood_of_configuration([1 0], 1, 1, 1, pi/2);
fatalAssertEqual(tc, cs(1, :), [1 -1 - 1i]); 
fatalAssertEqual(tc, cs(2, :), [1 -1i]); 
fatalAssertEqual(tc, cs(3, :), [1 1 - 1i]); 
fatalAssertEqual(tc, cs(10, :), [1i -1 - 1i], 'AbsTol', 1e-14); 

closest_angles = [0 0; pi 0];

[closest_angles, closest_distances] = update_closest_for_perturbation(1, [1 0], [1 0; 1 10], closest_angles);

fatalAssertEqual(tc, closest_distances, [0 0; 0 0]); 

[closest_angles, closest_distances] = update_closest_for_perturbation(1, [1 1i], [1 0; 1 11], closest_angles);
fatalAssertGreaterThan(tc, closest_distances(1, 2), 1); 
fatalAssertLessThan(tc, closest_angles(1, 2), 0); 
fatalAssertLessThan(tc, closest_angles(2, 1), pi); 

[scores, closest_angles] = score_perturbations(1, [1 .1], [1 0; 1 10], [20; -20], [0 0; pi - pi/50 0]);
fatalAssertEqual(tc, scores, Inf); 

[scores, closest_angles] = score_perturbations(1, [1 -1], [1 0; 1 10], [-20; 20], [0 0; pi - pi/50 0]);
fatalAssertEqual(tc, scores, 20 - 6); 
fatalAssertEqual(tc, closest_angles, [0 0; pi 0]); 

r = exp(i * (pi/2 - pi/50)); % almost at 90'
d = ellipse_distance_to_point([i -10], -20);
fatalAssertEqual(tc, d, 20 - 10 - 6);

d = ellipse_distance_to_point([r -10], -20);
fatalAssertLessThan(tc, d, 20 - 10 - 5);

[t1, t2, d] = edge_points_dist_between_ellipses([i -10], [i 10], -pi/2 - pi/50, pi/2 + pi/50, pi/50, 30);
fatalAssertEqual(tc, [t1 t2 d], [-pi/2 pi/2 8], 'AbsTol', 1e-14)


[closest_angles, closest_distances] = update_closest([i -10; i 10], [0 -pi/2 - pi/50; pi/2 + pi/50 0]);
fatalAssertEqual(tc, closest_angles, [0 -pi/2; pi/2 0], 'AbsTol', 1e-14); 
fatalAssertEqual(tc, closest_distances, [0 8; 8 0]), 'AbsTol', 1e-14; 

[closest_angles, closest_distances] = update_closest_for_perturbation(1, [i -10], [r -10; r 10], [0 -pi/2 - pi/50; pi/2 + pi/50 0]);
fatalAssertEqual(tc, closest_angles(1,2), -pi/2, 'AbsTol', 1e-14); 

[closest_angles, closest_distances] = update_closest([i -10; i 10], [0 -pi/2; pi/2 + pi/50 0]);
fatalAssertEqual(tc, closest_angles, [0 -pi/2;  pi/2 0], 'AbsTol', 1e-14); 
fatalAssertEqual(tc, closest_distances, [0 8; 8 0]); 

[closest_angles, closest_distances] = update_closest_for_perturbation(2, [i 10], [i -10; r 10], [0 -pi/2; pi/2 + pi/50 0]);
fatalAssertEqual(tc, closest_angles, [0 -pi/2;  pi/2 0], 'AbsTol', 1e-14); 
fatalAssertEqual(tc, closest_distances, [0 8; 8 0]); 


[scores, closest_angles] = score_perturbations(2, [i 10], [i -10; r 10], [-20; 20], [0 -pi/2 - pi/50; pi/2 + pi/50 0]);
fatalAssertEqual(tc, scores, 20 - 10 - 6); % major axis has length 6 
fatalAssertEqual(tc, closest_angles, [0 -pi/2; pi/2 0], 'AbsTol', 1e-14); 

[closest_angles, closest_distances] = update_closest_for_perturbation(1, [1 -1], [1 0; 1 10], [0 0; pi - pi/50 0]);

fatalAssertEqual(tc, closest_angles, [0 0; pi 0]); 
fatalAssertEqual(tc, closest_distances, [0 1; 1 0]); 

[projected, closest_angles] = random_project(2, [1 0; 1 10], [1 0; 1 10 - .008], [0 0; pi - pi/50 0]);
fatalAssertEqual(tc, projected, [1 10], 'AbsTol', 1e-14); 

%fatalAssertEqual(tc, closest_angles, [0 0; pi 0], 'AbsTol', 1e-14); 
%fatalAssertLessThan(tc, edge_points_dist_between_ellipses([1 0], [1 10], 1e-15)
%fatalAssertEqual(tc, dist_between_ellipses_closest([1 0], [1 11], 0, pi), 1)
end

