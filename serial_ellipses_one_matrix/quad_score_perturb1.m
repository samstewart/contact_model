function scores = quad_score_perturb1(e1, others, perturbations, des1, t1, t2)
n = size(perturbations, 1);
scores = zeros(n, 1);

for m = 1:n
		
	
	% do we intersect the other ellipse?
	me = perturbations(m, :);
	
	
	% do we overlap any other ellipses?
	if overlaps_other_ellipses(me, others) 
	
	       scores(m) = Inf;
       else
%		       scores(m) = abs(config(2) - desired_c(k)) + abs(angle(config(1) / cur_c(k, 1)));
	       scores(m) = ellipse_distance_to_point(me, des1); % try to minimize distance to the goal
%	       scores(m) = abs(config(2) - desired_c(k));
       end

end
	
end
