function d = overlap(c1, c2)
% make the projection matrix onto each of the normals through each edge

% find the vectors aligned to the edges
rect1 = rect_from_configuration(c1);
rect2 = rect_from_configuration(c2);

edges = [unit_edges(rect1) unit_edges(rect2)];

% find normals
normals = i*edges;

% make the projection matrix
P = diag(normals);

% have to congugate because we are using the inner product of each row of P with rect1
projected_rect1 = real(P * repmat(conj(rect1), length(normals), 1));
projected_rect2 = real(P * repmat(conj(rect2), length(normals), 1));

intervals1 = [min(projected_rect1, [], 2) max(projected_rect1, [], 2)];
intervals2 = [min(projected_rect2, [], 2) max(projected_rect2, [], 2)];

overlaps = intervals_overlap(intervals1, intervals2);

d = min(overlaps);

end
