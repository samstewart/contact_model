function distances = distances_between_ellipses(ellipses1, ellipses2, obstacles, short_radius, long_radius)
% returns matrix d(i, j) of distance from point i to object j in the world.
% todo: should work like pdist but extended to different classes of object
distances = zeros(size(ellipses1, 1), size(ellipses2, 1));

for i = 1:size(ellipses1, 1)
	% compute the distance to the boundary of the other guys	
	for j = 1:size(ellipses2, 1)

		distances(i, j) = dist_between_ellipses(ellipses1(i, :), ellipses2(j, :), short_radius, long_radius); 

	end

	% compute the shortest distance to the obstacles
%	for j =  1:size(obstacles, 1)
	
%		distances_to_obstacles(j) = dist_from_point_to_line(points(i), obstacles(j, 1), obstacles(j, 2));

%	end


%	distances(i, :) = [distances_to_agents distances_to_obstacles];
	
end

distances;
end
