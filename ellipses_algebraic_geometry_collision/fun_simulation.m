function fun_simulation(config_0 ) 
% q_0: the current position (should be legal) in complex coordinates. so 1xn vector of complex coordinates
% desired_v: a function returning the desired velocity (as a column vector of complex numbers) 
%c = config_0;
%v = VideoWriter('weird_artifact.avi')
%v.Quality = 25; % much better file sizes!
%v.FrameRate = 24;
%open(v)
%set(gca, 'nextplot', 'replacechildren');

timestep = .2;
daspect([1 1 1]);
axis([-20 20 -20 20]);
c = config_0;

t1 = 0;
t2 = pi;
    plot_ellipses(c);


for t = 2:800
    cla;
	[t1, t2, d] = edge_points_dist_between_ellipses(c(1, :), c(2, :), t1, t2, pi/60, 10);
	
	ps = [points_on_boundary_in_interval(c(1, :), t1) points_on_boundary_in_interval(c(2, :), t2)];
	
	line(real(ps), imag(ps));

	
	ps = [c(1, 2) c(2, 2)];
%	line(real(ps), imag(ps), 'Color', 'r')

    % draw the guys
    plot_ellipses(c);

c(1, 2) = c(1, 2) + .1i;
c(2, 1) = exp(i * pi/100) * c(2, 1);
%t1
    
    for k = 1:size(c, 1)
%	goal_direction = targets(k) - c(k, 2);
%	if abs(goal_direction) < 1e-4
%		goal_direction = 0;
%	else
%		goal_direction = goal_direction / abs(goal_direction);
%	end
%
%	p1 = c(k, 2);
%	p2 = c(k, 2) + 1.5 * goal_direction;
%	ps = [p1 p2];
%
%	line(real(ps), imag(ps))
   end 

   drawnow;

%writeVideo(v, getframe(gca)); 
end

%close(v);
end     
