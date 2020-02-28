function fun_simulation(q_0, desired_v, radius) 
% q_0: the current position (should be legal) in complex coordinates. so 1xn vector of complex coordinates
% desired_v: a function returning the desired velocity (as a column vector of complex numbers) 
q = q_0;

n = size(q, 1) / 2;
h = .2;

%v = VideoWriter('uzawa_circles.avi')
%v.Quality = 100;
%v.FrameRate = 24;
%open(v)
%set(gca, 'nextplot', 'replacechildren');


axis([-20 20 -20 20]);
daspect([1 1 1]);
for t = 1:400
    cla;
    % draw the guys
    c = ones(n, 2);
    c(:, 2) = q;
    plot_ellipses(c)

%    % draw the circles	
%    for i = 1:size(obstacles, 1)
%	    line(real(obstacles(i, :)), imag(obstacles(i, :)))
%    end

    drawnow;
   
     q = q + h * uzawa_project(q, desired_v(q), radius, h);
end

%close(v)

end     
