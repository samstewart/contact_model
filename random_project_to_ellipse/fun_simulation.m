function fun_simulation(q_0, desired_v) 
% q_0: the current position (should be legal) in complex coordinates. so 1xn vector of complex coordinates
% desired_v: a function returning the desired velocity (as a column vector of complex numbers) 
q = q_0;

%v = VideoWriter('circle.avi')
%v.Quality = 100;
%v.FrameRate = 24;
%open(v)
%set(gca, 'nextplot', 'replacechildren');


timestep = .2;
daspect([1 1 1]);
path = zeros(700, 1);
path(1) = q_0;
for t = 2:700
    cla;
    % draw the guys
    scatter(real(q), imag(q), 30, 'filled');
    ps = points_on_boundary([1 0], 5, 5, 200);
    line(real(ps), imag(ps))
%   viscircles([0 0], 5);
%    % draw the circles	
%    for i = 1:size(obstacles, 1)
%	    line(real(obstacles(i, :)), imag(obstacles(i, :)))
%    end

    hold off;
    axis([3 6 -5 0]);
    t
%    q = q + timestep * desired_v(q)
    q = random_project(q, q + timestep * desired_v(q)); 
    path(t) = q;
     ps = path(1:t);
    line(real(ps), imag(ps)) 
    drawnow;

  % writeVideo(v, getframe(gca)); 
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
