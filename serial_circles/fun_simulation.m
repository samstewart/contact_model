function fun_simulation(x_0, targets) 
% q_0: the current position (should be legal) in complex coordinates. so 1xn vector of complex coordinates
% desired_v: a function returning the desired velocity (as a column vector of complex numbers) 
x = x_0;
	epsilon = .04;
	rand_perturbation = rand(length(x), 1) * 2 * epsilon - epsilon  + i*(rand(length(x), 1) * 2 * epsilon - epsilon);
	x = rand_perturbation + x;
	
	rand_perturbation = rand(length(x), 1) * 2 * epsilon - epsilon  + i*(rand(length(x), 1) * 2 * epsilon - epsilon);
	targets = targets + rand_perturbation;
v = VideoWriter('teams_crashing_two.avi')
v.Quality = 25; % much better file sizes!
v.FrameRate = 24;
open(v)
set(gca, 'nextplot', 'replacechildren');

timestep = .2;
daspect([1 1 1]);
path = zeros(700, 1);
path(1) = x_0(2);
axis([-20 20 -20 20]);
for t = 2:600
    cla;

    % draw the guys
     viscircles([real(x) imag(x)], 1 * ones(length(x), 1));
    
    for k = 1:length(x)
	goal_direction = targets(k) - x(k);
	goal_direction = goal_direction / abs(goal_direction);
	p1 = x(k);
	p2 = x(k) + 1.5 * goal_direction;
	ps = [p1 p2];

	line(real(ps), imag(ps))
    end 

    %scatter(real(targets), imag(targets), 20, 'filled')
%    % draw the circles	
%    for i = 1:size(obstacles, 1)
%	    line(real(obstacles(i, :)), imag(obstacles(i, :)))
%    end

    
%    q = q + timestep * desired_v(q)
%    desired_conf = x + timestep * desired_v(x);

    for k = shuffle(1:length(x))
%	   before = x(k);
	epsilon = .004;
	rand_perturbation = rand(1) * 2 * epsilon - epsilon  + i*(rand(1) * 2 * epsilon - epsilon);
	x(k) = random_project(k, x, targets(k));
	x(k) = x(k) + rand_perturbation;
%	if abs(before - x(k)) > 1e-9
%		break;
%	end
    end

%    path(t) = x(2);
%     ps = path(1:t);
%    line(real(ps), imag(ps)) 
    drawnow;

writeVideo(v, getframe(gca)); 
    % the velocity should always point towards (0, -10)
    % velocity_pointing_at_point(q, [0 -10], .3)
    
    % Shouldn't the projection be linear since we are projecting onto a
    % linear space? No, projecting onto half space doesn't have to be
    % linear? What is the continuity of the projection based on the set?
    % Would think it should be exactly the continuity of the boundary
%    q = project_to_legal_position(q, q + h * desired_v(q), radius);
%     q = q + uzawa_project(q, desired_v(q), radius, h);
end

close(v)

end     
