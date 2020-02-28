function overlap_vector = overlap_between_polygons(polygonA, polygonB)
% overlap vector points in the direct required to move polygonA off of polygonB. The magnitude of this vector is amount of overlap.

% winding number of counterclockwise is crucial (I think)
overlap_vectors = zeros(size(polygonA)); % normal vectors to each edge (assume polygon given in counterclockwise ordering)

% loop through all the edges of the first polygon
% todo: can we turn this all into matrix multiplication and get rid of the loop?
for i = 1:length(polygonA)

	overlap_vectors(i) = overlap_vector_for_edge(polygonA, polygonB, i)

end

% how is my previous scheme related to this?
% find the edge with the smallest overlap (so smallest move to fix it)
% if no overlap, will return zero vector (all projects from each edge must have nonzero overlap for this to work)
[least_overlap, least_overlap_edge] = min(abs(overlap_vectors));

overlap_vectors(least_overlap_edge)

end
