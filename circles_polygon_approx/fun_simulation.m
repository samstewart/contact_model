function fun_simulation(ellipses, obstacles, desired_v, short_radius, long_radius) 
% q_0: the current position (should be legal) in complex coordinates. so 1xn vector of complex coordinates
% desired_v: a function returning the desired velocity (as a column vector of complex numbers) 

n = size(ellipses, 1);
h = .5;

v = VideoWriter('circle.avi')
v.Quality = 100;
v.FrameRate = 24;
open(v)
set(gca, 'nextplot', 'replacechildren');

n = 9;
axis square
for t = 1:700
    cla;
    % draw the guys
%    viscircles([real(q) imag(q)], radius * ones(n, 1), 'Color', 'r');
	
    hold on;
    for i = 1:size(obstacles, 1)
	    line(real(obstacles(i, :)), imag(obstacles(i, :)))
    end
    draw_ellipses(ellipses, short_radius, long_radius, n);
   hold off;
    axis([-20 20 -20 20]);
    drawnow;
   
%   writeVideo(v, getframe(gca)); 
    % the velocity should always point towards (0, -10)
    % velocity_pointing_at_point(q, [0 -10], .3)
    
    % Shouldn't the projection be linear since we are projecting onto a
    % linear space? No, projecting onto half space doesn't have to be
    % linear? What is the continuity of the projection based on the set?
    % Would think it should be exactly the continuity of the boundary
%    q = project_to_legal_position(q, q + h * desired_v(q), radius);
%     q = grid_project_to_legal_position(q + h * desired_v(q), obstacles, radius, .01) ; % the configuration space has a group structure. In fact, it is a Lie group? We can use this in the code by viewing each ellipse as itself a transformation (from the identity state in 'body space'). But we can also 'add together' ellipses as composition of transformations. I guess this is one way of looking at a Lie group, as a group where we can specify a flow (has a tangent space).  
% todo: make a method for incrementally flowing along a field on the tanget space
ellipses(:, 2) = ellipses(:, 2) + h * desired_v(ellipses);
ellipses = project_ellipses(ellipses, short_radius, long_radius, n);
end

close(v)

end     
