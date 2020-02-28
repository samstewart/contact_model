function projected  = random_project(e1, e2, des1, t1, t2)

	% never set neighborhood size to exactly step size or you will hit fixed point
	c = neighborhood_of_configuration(e1, 2, 3, .06, pi/150);
	
	scores = quad_score_perturb1(e1, e2, c, des1, t1, t2);

	% circle is at origin with radius 5
	[score, m] = min(scores);
	projected = c(m, :);
end
