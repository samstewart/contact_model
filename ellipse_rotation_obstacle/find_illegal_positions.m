function illegal_q = find_illegal_positions(q, obstacles, radius)

% we don't want to count the circle overlapping with itself.

distances = set_diagonal(distances_to_objects(q, q, obstacles, radius), Inf * ones(length(q)));


% Find the agents that overlap either other agents or other obstacles. Need the condition > 0 to avoid circles overlapping themselves.
illegal_q = find(any(distances < radius, 2))';


end
