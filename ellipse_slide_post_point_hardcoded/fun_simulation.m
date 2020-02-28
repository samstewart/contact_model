function fun_simulation(q_0, desired_v) 
% q_0: the current position (should be legal) in complex coordinates. so 1xn vector of complex coordinates
% desired_v: a function returning the desired velocity (as a column vector of complex numbers) 
q = q_0;


%v = VideoWriter('circle.avi')
%v.Quality = 100;
%v.FrameRate = 24;
%open(v)
%set(gca, 'nextplot', 'replacechildren');


daspect([1 1 1]);

a = 7;
b = 8;
ps = points_on_boundary([1 0], a, b, 50);
anchor = ps(15);
anchor = a;
n = 700;
soln = euler([a 0], @(soln) [-(a^2 - b^2) * cos(soln(2)) * sin(soln(2)) / sqrt(a^2 * cos(soln(2))^2 + b^2 * sin(soln(2))^2) 1], .01, n);

for t = 1:n
    cla;
    % what distinguishes the motion of an ellipse sliding along a point via only translation versus sliding along the point with translation *and* rotation?
    % draw the guys
%    scatter(0, 0, 30, 'filled');
    point = exp(i * soln(t, 2))*soln(t, 1) + 5;
    anchor = 5;
    scatter(real(anchor), imag(anchor));
    rot = exp(i * soln(t, 2));
    T = soln(t, 1);
%    T = anchor + 0 - rot * anchor;
    ps = points_on_boundary([1 point], a, b, 50);
    line(real(ps), imag(ps))
%    % draw the circles	
%    for i = 1:size(obstacles, 1)
%	    line(real(obstacles(i, :)), imag(obstacles(i, :)))
%    end

%    hold off;
    axis([-20 20 -20 20]);
%    v = uzawa_project(q, desired_v(q));
%
%    next_q = q + 3*v/l2_norm(v);
%    line([q(1) next_q(1)], [q(2) next_q(2)])
    drawnow;
%    timestep = .2;
%    q = q + timestep * v; % todo: when do we multiple by h?

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
