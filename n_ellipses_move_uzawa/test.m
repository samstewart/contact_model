%fun_simulation([], [])
%axis([-20 20 -20 20])
%ps = points_on_boundary([exp(i * pi/8) 0], 5, 8, 50);
%line(real(ps), imag(ps))
%complex_grid(1:2, 2:3)
%[s, i, j] = matrix_min([1 2; -1 -1])

%random_project(5, 5.1)
%fun_simulation([1 0; 1 (8 + 8i)], @(q) [0; (-.2 - .2i)])
%fun_simulation([1 0; 1 8 + 8i], @(ellipses) [0; -.3 - .2i])
%ellipses = [1 0; 1 8 + 8i; 1 8 - 8i; 1 16i; 1 -16i];
%plot_ellipses(ellipses)
%fun_simulation(ellipses, @(ellipses) [0; -.3; -.2; .1; .1])
fun_simulation([1 11 + 1i; 1 0], @(ellipses) [-.1 + .09i; 0])
%unit_normal_to_ellipse([1 0], pi, 5, 6)
%ellipses = [1 0; 1 10; 1 -10];
%[t1, t2, normal, d] = dist_between_ellipses([1 0; 1 10], 5, 6)
%[t1, t2, d] = dist_between_two_ellipses([1 0;], [1 9.9], 5, 6)
%unit_normal_to_ellipse(ellipses, t1, 5, 6)
%linear_operator_to_matrix_in_standard_basis(@(x) real([1 + 1i 2 + 3i; 1 + 2i 4 + 5i] * conj(x)), 2)
%constraint_matrix([1 0; 1 10; 1 -15], 1)
%sign_adjusted_pairwise_differences([1; 1i; 1 + 4i], [1 + 1i; 2 + 2i; 3 + 4i])
%unit_normal_to_ellipse([1 0], 0, 5, 6)
%complex_matrix_mult(1, 3 + 3i) 
%real([-1 + 1i 1] * [-6 + 2i; 3 + 4i])
%points_on_boundary([1 0; 1 1], 1, 1, 4)
%cla
%plot_ellipses([i 0; 1 10])

%uzawa_project([1 0; 1 10; 1 -10], [0; -.3; .3], .1)
%[v1, v2, lambda] = uzawa_project([1 0], [1 10], 0, -.2, .1);
%[v1 v2]
%complex_dot(1 + 1i, 2 + 2i)
%dist_between_ellipses([1 0], [1 12i], 5, 6)
%random_project(10, 9.9)
%A = [1 2; 3 4];
%logical(randi(0:1, size(A)))
%1440/ 40^2
%sum(~sample_matrix([40 40], .1), [1 2] 
%logical([1 0; 1 0]) | logical([1 1; 0 0])
