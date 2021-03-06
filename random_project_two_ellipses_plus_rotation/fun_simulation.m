function fun_simulation(conf_0, desired_v) 
% q_0: the current position (should be legal) in complex coordinates. so 1xn vector of complex coordinates
% desired_v: a function returning the desired velocity (as a column vector of complex numbers) 
conf = conf_0;

v = VideoWriter('two_ellipses_plus_rotation.avi')
v.Quality = 100;
v.FrameRate = 24;
open(v)
set(gca, 'nextplot', 'replacechildren');

timestep = .2;
daspect([1 1 1]);
path = zeros(700, 1);
path(1) = conf_0(2);

axis([-20 20 -20 20]);
for t = 2:400
    cla;
    % draw the guys
    scatter(real(conf(2)), imag(conf(2)), 30, 'filled');
    ps1 = points_on_boundary([1 0], 5, 6, 100);
    ps2 = points_on_boundary(conf, 5, 6, 100);
    line(real([conf(2) ps2(1)]), imag([conf(2) ps2(1)]))
    line(real(ps1), imag(ps1))
    line(real(ps2), imag(ps2))
%   viscircles([0 0], 5);
%    % draw the circles	
%    for i = 1:size(obstacles, 1)
%	    line(real(obstacles(i, :)), imag(obstacles(i, :)))
%    end

    
%    q = q + timestep * desired_v(q)
    desired_conf = [1 conf(2) + timestep * desired_v(conf)];
    conf = random_project(conf, desired_conf); 
    path(t) = conf(2);
     ps = path(1:t);
    line(real(ps), imag(ps)) 

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
