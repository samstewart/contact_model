function hopper_example(n)

	obstacles = [(-20 - 1i) (-3/2 - 10i); (3/2 - 10i) ( 20 - 1i)];

	q_0 = random_complex_numbers(n, [-10 10], [0 5]);

	speeds = .01 + .02 * rand(n, 1);
	
	fun_simulation(q_0, obstacles, @(q) velocity_pointing_at_point(q, -15*i * ones(n, 1), speeds), 1/2)


end
