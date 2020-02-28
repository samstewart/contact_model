%fun_simulation([], [])
%axis([-20 20 -20 20])
%ps = points_on_boundary([exp(i * pi/8) 0], 5, 8, 50);
%line(real(ps), imag(ps))
%complex_grid(1:2, 2:3)
%[s, i, j] = matrix_min([1 2; -1 -1])
%random_project(1, [0; 12 ], 0)
%fun_simulation([-10; 0; 10])
%ginput(1)
cla;
%[centers, goals] = input_circles(10)
%centers_backup = centers;
%centers(11:20) = centers(1:10) + 3
%centers(41:50) = centers(31:40) +2.5 
%centers(51:100) = -i*conj(centers(1:50) * i) - 3
goals(1:50) = 30 + 1i;
goals(51:100) = -30 - .4i;
%centers = [centers; -real(centers) + i * imag(centers)];
%goals = [goals; -real(goals) + i * imag(goals)];

%targets = -[-10 + 10i; 10 - 10i; -10 - 10i; 10 + 10i]
%targets = [29; 29; 29]
%targets = -[-10 + 10i; 10 - 10i; -10 - 10i]
%targets = -[-10 + 10i; 10 - 10i]
%centers1 = centers;
%goals1 = goals;
%
fun_simulation(centers, goals)
%centers(11:20) = -1 + 10i + -centers(1:10)
%viscircles([real(centers) imag(centers)], ones(length(centers), 1))
%goals(11:20) = goals(11:20) + 3i;
%p = viscircles([0 0; 10 10], [5 5])
%p.Children(1)
%rand(2, 1)*.2 - .1
%input_pos_and_goals()
%scatter(0, 0, 20, 'filled')
%fun_simulation([0; 6.1 - 10i; -6.1 - 10i; 6.1 + 10i]) % kind of a square moving to opposite corners
%fun_simulation([0; 6.1 - 10i; -6.1 - 10i])
%fun_simulation([0; 6.1 - 10i])
%overlaps_other_circles(2, [0; 10], -9)
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
