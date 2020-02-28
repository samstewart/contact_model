function fun_simulation(q_0, obstacles, desired_v, radius) 
% q_0: the current position (should be legal) in complex coordinates. so 1xn vector of complex coordinates
% desired_v: a function returning the desired velocity (as a column vector of complex numbers) 
q = q_0;

n = size(q, 1);
h = 2;

v = VideoWriter('circle.avi')
v.Quality = 100;
v.FrameRate = 24;
open(v)
set(gca, 'nextplot', 'replacechildren');


daspect([1 1 1]);
for t = 1:700
    cla;
    % draw the guys
    viscircles([real(q) imag(q)], radius * ones(n, 1), 'Color', 'r');

    % draw the circles	
    for i = 1:size(obstacles, 1)
	    line(real(obstacles(i, :)), imag(obstacles(i, :)))
    end

    hold off;
    axis([-20 20 -20 20]);
    drawnow;
   
   writeVideo(v, getframe(gca)); 
    % the velocity should always point towards (0, -10)
    % velocity_pointing_at_point(q, [0 -10], .3)
    
    % Shouldn't the projection be linear since we are projecting onto a
    % linear space? No, projecting onto half space doesn't have to be
    % linear? What is the continuity of the projection based on the set?
    % Would think it should be exactly the continuity of the boundary
%    q = project_to_legal_position(q, q + h * desired_v(q), radius);
     q = grid_project_to_legal_position(q + h * desired_v(q), obstacles, radius, .01) ;
end

close(v)

end     
