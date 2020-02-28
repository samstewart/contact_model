function fun_simulation(ellipses, desired_v) 
% q_0: the current position (should be legal) in complex coordinates. so 1xn vector of complex coordinates
% desired_v: a function returning the desired velocity (as a column vector of complex numbers) 

%v = VideoWriter('two_ellipses_uzawa_overlap_problem.avi')
%v.Quality = 100;
%v.FrameRate = 24;
%open(v)
set(gca, 'nextplot', 'replacechildren');

timestep = .1;
daspect([1 1 1]);
    axis([-20 20 -20 20]);
%path = zeros(700, 1);
path(1) = ellipses(2, 2);
for t = 2:500
    cla;

   % draw the guys
%   viscircles([0 0], 5);
%    % draw the circles	
%    for i = 1:size(obstacles, 1)
%	    line(real(obstacles(i, :)), imag(obstacles(i, :)))
%    end

    
%    q = q + timestep * desired_v(q)  
    vel = uzawa_project(ellipses, desired_v(ellipses), timestep)
    ellipses(:, 2) = ellipses(:, 2) + timestep * vel; 
    %[v1, v2, l] = uzawa_project([1 q(1)],[1 q(2)], v(1), v(2), timestep);
    path(t) = ellipses(2, 2);
     ps = path(1:t);
    line(real(ps), imag(ps)) 
plot_ellipses(ellipses);
drawnow
 

%   writeVideo(v, getframe(gca)); 
    % the velocity should always point towards (0, -10)
    % velocity_pointing_at_point(q, [0 -10], .3)
    
    % Shouldn't the projection be linear since we are projecting onto a
    % linear space? No, projecting onto half space doesn't have to be
    % linear? What is the continuity of the projection based on the set?
    % Would think it should be exactly the continuity of the boundary
%    q = project_to_legal_position(q, q + h * desired_v(q), radius);
%     q = q + uzawa_project(q, desired_v(q), radius, h);
end

%close(v)

end     
