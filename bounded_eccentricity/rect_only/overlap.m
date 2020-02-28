function d = overlap(c1, c2)
% make the projection matrix onto each of the normals through each edge

% find the vectors aligned to the edges
ellipse1 = ellipse_from_configuration(c1);
ellipse2 = ellipse_from_configuration(c2);

edges = [unit_edges(ellipse1) unit_edges(ellipse2)];

% find normals
normals = i*edges;

% make the projection matrix
P = diag(normals);

% have to congugate because we are using the inner product of each row of P with ellipse1
projected_ellipse1 = real(P * repmat(conj(ellipse1), length(normals), 1));
projected_ellipse2 = real(P * repmat(conj(ellipse2), length(normals), 1));

intervals1 = [min(projected_ellipse1, [], 2) max(projected_ellipse1, [], 2)];
intervals2 = [min(projected_ellipse2, [], 2) max(projected_ellipse2, [], 2)];

overlaps = intervals_overlap(intervals1, intervals2);

d = min(overlaps);

end
