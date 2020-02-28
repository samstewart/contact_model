function edges = unit_edges(polygon)
% make list of complex numbers (vectors) pointing in direction of edges oriented CC
edges = zeros(size(polygon));

edges(1:(end - 1)) = diff(polygon);
edges(end) = polygon(1) - polygon(end);

edges = edges ./ abs(edges);

end
