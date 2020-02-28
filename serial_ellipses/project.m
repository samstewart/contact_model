function v_cur = project(v_prime, c1, c2, L)
lambda = 0;
v_cur = [0; 0; 0; 0];
v_last = [0; 0; 0; 0]; 
error_k = Inf;
% the rotation normals should have the same sign / direction, or that might depend on the rotation
% I think waaay to abstractly and that's how I get into trouble on many levels in life.
[total_steps, p1, p2, n1, n2] = two_point_ellipse_dist(c1, c2)
rn1 = complex_cross(p1 - c1(2), n1);
rn2 = complex_cross(p2 - c2(2), n2);
constraint_normals = [n1; rn1; n2; rn2];
% let's first just test that it works with normal translations
%constraint_normals = zeros(2,1)
%constraint_normals = [n1; n2];
signed_distances = signed_ellipse_dist(c1, c2, p1, p2);
h = 1;
rho = .5;
A = diag([1; L; 1; L]);

while error_k > 1e-4 
	v_last = v_cur;
	% the 1/L will slow descent in the rotational coordinates
	% can Alex's publication use Uzawa? Is Uzawa just another form of coordinate descent?
	v_cur = inv(A) * (v_prime - (-h * constraint_normals * lambda))
	% this is just the slack Ax + b which we want to drive to zero
	constraint_gradient = complex_dot(-h * transpose(constraint_normals), v_cur) - signed_distances
	lambda = max(0, lambda + rho * constraint_gradient);
	error_k = sum(abs(max(0, rho * constraint_gradient)));
end	
end
