%fun_simulation([], [])
%axis([-20 20 -20 20])
%ps = points_on_boundary([exp(i * pi/8) 0], 5, 8, 50);
%line(real(ps), imag(ps))
%complex_grid(1:2, 2:3)
%[s, i, j] = matrix_min([1 2; -1 -1])

%random_project(5, 5.1)
fun_simulation(8 + 8i, @(q) -.8 - .8i)
%unit_normal_to_ellipse([1 0], 0, 5, 6)
%uzawa_project([1 10], -.2, .1)
%complex_dot(1 + 1i, 2 + 2i)
%dist_between_ellipses([1 0], [1 12i], 5, 6)
%random_project(10, 9.9)
%A = [1 2; 3 4];
%logical(randi(0:1, size(A)))
%1440/ 40^2
%sum(~sample_matrix([40 40], .1), [1 2] 
%logical([1 0; 1 0]) | logical([1 1; 0 0])
