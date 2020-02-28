%ellipses = [1 0; 1 11; 1 15i; 1 -13i; exp(i * pi/10) -13];
%targets = [20 + 4i; -20 - 10i; 10 - 10i; -10 + 10i; 20 + 4i]
ellipses = [1 0; 1 12 + 5i];
targets = [30  -30 ];
%plot_ellipses(ellipses)
%fun_sim_quad(ellipses, targets)

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
c = ellipses;


t1 = 0;
t2 = pi;
    plot_ellipses(c);


for t = 2:800
    cla;
	[t1, t2, d] = edge_points_dist_between_ellipses(c(1, :), c(2, :), t1, t2, pi/60, 10);
	ps = [points_on_boundary_in_interval(c(1, :), t1) points_on_boundary_in_interval(c(2, :), t2)];
	line(real(ps), imag(ps), 'Color', 'r');
%	
%	ps = [c(1, 2) c(2, 2)];
%	line(real(ps), imag(ps), 'Color', 'r')

    % draw the guys
    plot_ellipses(c);

%c(1, 2) = c(1, 2) + .1i;
%c(2, 1) = exp(i * pi/100) * c(2, 1);
%t1
    
    for k = 1:size(c, 1)
	goal_direction = targets(k) - c(k, 2);
	if abs(goal_direction) < 1e-4
		goal_direction = 0;
	else
		goal_direction = goal_direction / abs(goal_direction);
	end

	p1 = c(k, 2);
	p2 = c(k, 2) + 1.5 * goal_direction;
	ps = [p1 p2];

if k == 1	
%	c(k, 2) = c(k, 2) + .01 * goal_direction;
		[t1, t2, d] = edge_points_dist_between_ellipses(c(1, :), c(2, :), t1, t2, pi/60, 10)
	c(k, :) = random_project1(c(1, :), c(2, :), targets(1), t1, t2);
end
	line(real(ps), imag(ps))
   end 
	

   drawnow;
%pause(.2)
%writeVideo(v, getframe(gca)); 
end

%close(v);

