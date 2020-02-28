function [normals, distances] = normals_and_distances_ellipses(c)
n = size(c, 1);
normals = zeros(n, n * (n - 1) / 2);
distances = zeros(n*(n - 1) / 2, 1);
k = 1;

for i = 1:(n - 1)
	for j = (i + 1):n
		
		c1 = c(i, :);
		c2 = c(j, :);
		% can rule out immediately guys that are farther away than the long axis 
%		if abs(c1(2) - c2(2)) < 2 * 6 
			[total_steps, p1, p2, n1, n2] = two_point_ellipse_dist(c1, c2);
			% did we max out?
%			if total_steps == 10
%				[i, j]
%			end
			ps = [p1 p1 + n1];
%			line(real(ps), imag(ps))	

			ps = [p2 p2 + n2];
%			line(real(ps), imag(ps))	

			normals(i, k) = n1;
			normals(j, k) = n2;

	        	distances(k) = signed_ellipse_dist(c1, c2, p1, p2);
%		else
%			distances(k) = 1;
%		end
		k = k + 1;

	end
end


end
