function scores = quad_score_perturb1(e1, e2, perturbations, des1, des2, t1, t2)
n = size(perturbations, 1);
scores = zeros(n, 1);

for m = 1:n
		
	
	% do we intersect the other ellipse?
	me = perturbations(m);

	[t1, t2, d] = edge_points_dist_between_ellipses(e1, e2, t1, t2); 

	% do we overlap any other ellipses?
	if d < 0 
	       scores(m) = Inf;
       else
%		       scores(m) = abs(config(2) - desired_c(k)) + abs(angle(config(1) / cur_c(k, 1)));
	       scores(m) = ellipse_distance_to_point(perturbations(m, :), desired_c(k)); % try to minimize distance to the goal
%	       scores(m) = abs(config(2) - desired_c(k));
       end

end
	
end
