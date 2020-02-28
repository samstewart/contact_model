function projected  = random_project(k, cur_c, desired_c)

	c = neighborhood_of_configuration(cur_c(k, :), 2, 2, .01, pi/150);
	
	scores = quad_score_perturb(k, c, cur_c, desired_c);

	% circle is at origin with radius 5
	[score, m] = min(scores);

	projected = c(m, :); 


end
