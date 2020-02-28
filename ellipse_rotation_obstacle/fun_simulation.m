function fun_simulation(q_0, desired_v) 
% q_0: the current position (should be legal) in complex coordinates. so 1xn vector of complex coordinates
% desired_v: a function returning the desired velocity (as a column vector of complex numbers) 
q = q_0;


%v = VideoWriter('circle.avi')
%v.Quality = 100;
%v.FrameRate = 24;
%open(v)
%set(gca, 'nextplot', 'replacechildren');

timestep = .01;
daspect([1 1 1]);
block_point = [-7; 0];
rotation = pi/4; 
for t = 1:700
    cla;
    % draw the guys
    scatter(block_point(1), block_point(2), 30, 'filled');

    axis([-20 20 -20 20]);
	
    % todo: we are switching between two many representations. What is the best one for the numerics? Probably the level set one
    % todo: would be nice to parameterize ellipse points somehow
    rot_v = uzawa_project([0;0;rotation], 1, block_point);
    rotation = rotation + timestep * rot_v;
    rotOp = exp(i * rotation);
    ps = points_on_boundary([rotOp 0], 5, 8, 50);
    line(real(ps), imag(ps))
%    % draw the circles	
%    for i = 1:size(obstacles, 1)
%	    line(real(obstacles(i, :)), imag(obstacles(i, :)))
%    end

    hold off;
%    v = uzawa_project(q, desired_v(q));

%    next_q = q + 3*v/l2_norm(v);
%    line([q(1) next_q(1)], [q(2) next_q(2)])
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
