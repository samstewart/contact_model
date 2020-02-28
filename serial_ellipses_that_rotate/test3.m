function tests = test2Test
tests = functiontests(localfunctions);
end

function testQuadraticStuff(tc)

%fatalAssertEqual(tc, quadratic_form_for_ellipse([1 0]), [-1/5^2 0 0; 0 -1/6^2 0; 0 0 1], 'AbsTol', 1e-14); 
%fatalAssertEqual(tc, quadratic_form_for_ellipse([1 1]), [-1/5^2 0 -1; 0 -1/6^2 0; 0 0 1], 'AbsTol', 1e-14); 


% test the distance to a point
%[t1, d] = dist_to_point([1 5], pi, 0, pi/60, 10);

%fatalAssertEqual(tc, t1, pi); 

x = linspace(-1, 1, 300);
%
%[m1, m2, d] = min_two_variable_function(@(x, y) (x - 1/2)^2 + (y - 1/3)^2, x, x)
%x(m1)
%x(m2)
%
%x(m1)
%x(m2)
[m1, m2, d] = edge_points_dist_between_ellipses([1 0], [1 9.99], 0, pi, pi/60, 10)

end

