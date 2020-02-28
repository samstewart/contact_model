function cs = neighborhood_of_configuration(c, n_x, n_theta, dx, dtheta)
	% generate possible positions
	reals = dx * (-n_x:n_x);
	imags = reals;

	% perturbations of player k	
	r = c(1)*[1 exp(i * linspace(-dtheta, dtheta, n_theta))]; % we include the do nothing rotation 
	x = c(2) + complex_grid(reals, imags); 

	cs = cartesian_product(r, x);

end
