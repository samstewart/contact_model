function [min1, min2, d] = edge_points_dist_between_ellipses(e1, e2, theta1, theta2, w, n)
	
	dist = @(p1, p2) signed_dist_between_points_on_ellipses(e1, e2, p1, p2);
	
	theta1 = theta1 + linspace(-w, w, 2 * n + 1); 
	theta2 = theta2 + linspace(-w, w, 2 * n + 1); 
	ps1 = points_on_boundary_in_interval(e1, theta1);
	ps2 = points_on_boundary_in_interval(e2, theta2);	

	[min1, min2, d] = min_two_variable_function(dist, ps1, ps2);

	min1 = theta1(min1);
	min2 = theta2(min2);

end
