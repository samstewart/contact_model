% fun_simulation([0; 0; 12; 0], @(q) [.1; 0; -.1; 0], 5)

%normal_vector_between_circles([-1; 1], 1, 2)
%= [-1, 1]
%pairwise_distances([-1; 1; 2]) = [2 3 1]
%constraint_matrix([-1; 1; 2])
%uzawa_project([0; 1], [0; 1], 1/2, 1)
q = [0; 12; -10]
desired_v = @(q) [0; -.1 + .1i; .1 + .1i]
h = .2
radius = 5
n = size(q, 1);
axis([-20 20 -20 20]);
daspect([1 1 1]);
for t = 1:400
    cla;
    % draw the guys
    c = ones(n, 2);
    c(:, 2) = q;
    plot_ellipses(c);

%    % draw the circles	
%    for i = 1:size(obstacles, 1)
%	    line(real(obstacles(i, :)), imag(obstacles(i, :)))
%    end

    drawnow;
   
     q = q + h * uzawa_project(q, desired_v(q), radius, h);
end


