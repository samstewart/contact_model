%fun_simulation([], [])
%axis([-20 20 -20 20])
%ps = points_on_boundary([exp(i * pi/8) 0], 5, 8, 50);
%line(real(ps), imag(ps))
%complex_grid(1:2, 2:3)
%[s, i, j] = matrix_min([1 2; -1 -1])
%random_project([1 10], [1 9.9])
fun_simulation([1 6.1 - 10i], @(q) -.3)
%cartesian_product([1+ 1i 2 + 2i], [3 + 3i 4 + 4i])
%[1 + 1i 3 + 4i]/2i
%Jps = points_on_boundary([1 10 + 1e-14], 5, 6, 10)
%pred = inside_ellipse([1 0], ps, 5, 6)
%ps(pred)
%complex_grid([1 2], [3 4])
%random_project(10, 10)
%ellipses_overlap([1 0], [1 11], 5, 6)
%Jlogical(3, 1)
%abs(-.3 -.3i)*.2
%dist_between_ellipses([1 0], [1 10], 5, 6)
%random_project(10, 9.9)
%A = [1 2; 3 4];
%logical(randi(0:1, size(A)))
%1440/ 40^2
%sum(~sample_matrix([40 40], .1), [1 2] 
%logical([1 0; 1 0]) | logical([1 1; 0 0])
