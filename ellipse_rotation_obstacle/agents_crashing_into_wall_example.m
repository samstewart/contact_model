function agents_crashing_into_wall(n)

q_0 = random_complex_numbers(n, [-10 10], [-5 5]);

speeds = .2 * rand(n, 1);

fun_simulation(q_0, [(-20 - 6i) (20 - 6i);], @(q) velocity_pointing_at_point(q, (0 - 10i) * ones(n, 1), speeds), 1/2)

end
