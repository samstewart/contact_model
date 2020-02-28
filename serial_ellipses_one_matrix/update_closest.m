function [closest_angles, closest_distances] = update_closest(c, closest_angles)

n = size(c, 1);
closest_distances = zeros(n, n);
for k = 1:n
	for m = 1:n
		e1 = c(k, :);
		e2 = c(m, :);

%		if k < m && could_be_overlapping(e1, e2) (don't do the overlap check yet)
%		upper half of the matrix
		if k < m
			p1 = closest_angles(k, m);
			p2 = closest_angles(m, k);

			[p1, p2, d] = edge_points_dist_between_ellipses(e1, e2, p1, p2, pi/50, 60);
				
			closest_angles(k, m) = p1;
			closest_angles(m, k) = p2;
			closest_distances(k, m) = d;
			closest_distances(m, k) = d;
		end
	end
end
end
