function fun_sim_quad(config_0, targets) 
c = config_0;
v = VideoWriter('three_ellipses.avi')
v.Quality = 25; % much better file sizes!
v.FrameRate = 24;
open(v)
set(gca, 'nextplot', 'replacechildren');


timestep = .2;
daspect([1 1 1]);
%Jkpath = zeros(700, 1);
%path(1) = x_0(2);
axis([-40 40 -40 40]);
axis square;
%[t1, t2, d] = edge_points_dist_between_ellipses(c(1, :), c(2, :), 0, 0, pi, 500)
%closest_angles = [0 t1; t2 0]

for t = 2:1200
    cla;

    % draw the guys
    plot_ellipses(c);


%	pause( 2);
    for k = 1:size(c, 1)
	goal_direction = targets(k) - c(k, 2);
	if abs(goal_direction) < 1e-4
		goal_direction = 0;
	else
		goal_direction = goal_direction / abs(goal_direction);
	end

	% plot velocities
	p1 = c(k, 2);
	p2 = c(k, 2) + 1.5 * goal_direction;
	ps = [p1 p2];

	line(real(ps), imag(ps))

	c(k, :) = random_project(k, c, targets);

    end 

    drawnow;

writeVideo(v, getframe(gca)); 
end

close(v)
end
