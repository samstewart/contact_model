function [scores, closest_angles] = score_perturbations(k, perturbations, cur_c, desired_c, closest_angles)
n = size(perturbations, 1);
scores = zeros(n, 1);

for m = 1:n
		
	[closest_angles, closest_distances] = update_closest_for_perturbation(k, perturbations(m, :), cur_c, closest_angles);	
	
	% do we overlap any other ellipses?
	if any(closest_distances(k, :) < 0) 
	%if overlaps_other_ellipses(k, cur_c, config)
	       scores(m) = Inf;
       else
%		       scores(m) = abs(config(2) - desired_c(k)) + abs(angle(config(1) / cur_c(k, 1)));
	       scores(m) = ellipse_distance_to_point(perturbations(m, :), desired_c(k)); % try to minimize distance to the goal
%	       scores(m) = abs(config(2) - desired_c(k));
       end

end
	
end
