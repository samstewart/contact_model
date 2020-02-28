function normals = unit_normals(polygon)
normals = zeros(size(polygon));

% is there anyway to get rid of this edge case?
% compute the edge vectors, then rotate
normals(1:(end - 1)) = diff(polygon);
normals(end) = polygon(1) - polygon(end);

normals = normals ./ abs(normals);
normals = i * normals; 

end
