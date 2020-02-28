function fun_simulation(q_0, desired_v, radius) 
% q_0: the current position (should be legal) in complex coordinates. so 1xn vector of complex coordinates
% desired_v: a function returning the desired velocity (as a column vector of complex numbers) 
q = q_0;

n = size(q, 1) / 2;
h = .2;

%v = VideoWriter('uzawa_circles.avi')
%v.Quality = 100;
%v.FrameRate = 24;
%open(v)
%set(gca, 'nextplot', 'replacechildren');


   axis([-20 20 -20 20]);
daspect([1 1 1]);
for t = 1:400
    cla;
    % draw the guys
    viscircles([q(1:2:end) q(2:2:end)], radius * ones(n, 1), 'Color', 'r');

%    % draw the circles	
%    for i = 1:size(obstacles, 1)
%	    line(real(obstacles(i, :)), imag(obstacles(i, :)))
%    end

    drawnow;
   
%   writeVideo(v, getframe(gca)); 
    % the velocity should always point towards (0, -10)
    % velocity_pointing_at_point(q, [0 -10], .3)
    
    % Shouldn't the projection be linear since we are projecting onto a
    % linear space? No, projecting onto half space doesn't have to be
    % linear? What is the continuity of the projection based on the set?
    % Would think it should be exactly the continuity of the boundary
%    q = project_to_legal_position(q, q + h * desired_v(q), radius);
     q = q + h * uzawa_project(q, desired_v(q), radius, h);
end

%close(v)

end     
