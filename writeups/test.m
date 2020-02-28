%fun_simulation([], [])
%axis([-20 20 -20 20])
%ps = points_on_boundary([exp(i * pi/8) 0], 5, 8, 50);
%line(real(ps), imag(ps))
%complex_grid(1:2, 2:3)
%[s, i, j] = matrix_min([1 2; -1 -1])

%random_project(5, 5.1)
%fun_simulation(8 + 8i, @(q) -.1 - .1i)
a = 5;
b = 6;
clear i
ellipse = @(theta) 5 * cos(theta) + i * 6 * sin(theta)

[theta, fval] = fminsearch(@(theta) abs(ellipse(theta(1)) - ellipse(theta(2)) - 11)^2, [0 0])

%dist_between_ellipses([1 0], [1 10.1], 5, 5)
%A = [1 2; 3 4];
%logical(randi(0:1, size(A)))
%1440/ 40^2
%sum(~sample_matrix([40 40], .1), [1 2] 
%logical([1 0; 1 0]) | logical([1 1; 0 0])
