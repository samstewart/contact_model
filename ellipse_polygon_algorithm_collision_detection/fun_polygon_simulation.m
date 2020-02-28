function fun_simulation(polygons, obstacles, desired_v ) 
% q_0: the current position (should be legal) in complex coordinates. so 1xn vector of complex coordinates
% desired_v: a function returning the desired velocity (as a column vector of complex numbers) 

n = size(polygons, 1);
h = .5;

n = 20;
axis square
for t = 1:700
    cla;
    % draw the guys
%    viscircles([real(q) imag(q)], radius * ones(n, 1), 'Color', 'r');
	
    draw_polygons(polygons);
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
centers = centers_of_mass_of_polygons(polygons);

for i = 1:size(polygons, 2)
	v = h * desired_v(transpose(centers));
	polygons(:, i) = polygons(:, i)  + v(i);
end

polygons = polygon_project(polygons, []);
end

%close(v)

end 
