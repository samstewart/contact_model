function scores = quad_score_perturb(k, perturbations, cur_c, desired_c)
n = size(perturbations, 1);
scores = zeros(n, 1);

for m = 1:n
		
	
	% do we overlap any other ellipses?
	if any_quad_overlap(replace_row(cur_c, k, perturbations(m, :))) 
	%if overlaps_other_ellipses(k, cur_c, config)
	       scores(m) = Inf;
       else
%		       scores(m) = abs(config(2) - desired_c(k)) + abs(angle(config(1) / cur_c(k, 1)));
	       scores(m) = ellipse_distance_to_point(perturbations(m, :), desired_c(k)); % try to minimize distance to the goal
%	       scores(m) = abs(config(2) - desired_c(k));
       end

end
	
end
