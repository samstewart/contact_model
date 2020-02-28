function [normals, distances] = normals_and_distances_ellipses(c, major_axis, max_velocity)
n = size(c, 1);
normals = sparse(2*n, n * (n - 1) / 2);
distances = zeros(n*(n - 1) / 2, 1);
k = 1;

for i = 1:(n - 1)
	for j = (i + 1):n
		
		c1 = c(i, :);
		c2 = c(j, :);
		% can rule out immediately guys that are farther away than the long axis plus a velocity step. in other words, only look in a neighborhood
		if abs(c1(2) - c2(2)) < 2 * major_axis + max_velocity 
			[total_steps, p1, p2, n1, n2] = two_point_ellipse_dist(c1, c2);
%			for visualizing
%			ps = [p1 p1 + n1];
%			line(real(ps), imag(ps))	

%			ps = [p2 p2 + n2];
%			line(real(ps), imag(ps))	
			rn1 = complex_cross(p1 - c1(2), n1); % normals for rotation
			rn2 = complex_cross(p2 - c2(2), n2); % normals for rotation
			
			% encode one gradient constraint
			normals(2*i - 1, k) = n1;
			normals(2*i, k) = rn1;
			normals(2*j - 1, k) = n2;
			normals(2*j, k) = rn2;

	        	distances(k) = signed_ellipse_dist(c1, c2, p1, p2);
		else
			distances(k) = 1e+8; % needs to be large number
		end
		k = k + 1;

	end
end


end
