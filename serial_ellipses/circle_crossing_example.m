function circle_crossing_example(n, radius)
% radius:  
q_0 = transpose(radius * roots_of_unity(n));


% velocity points inwards on the circle
% same velocity
%speeds = .2 * ones(n, 1);

speeds = .01  + .02 * rand(n, 1);
guy_radius = 5;
tic
fun_simulation(complex_to_real_vector(q_0), @(q) complex_to_real_vector(velocity_pointing_at_point(real_to_complex_vector(q), -q_0, speeds)) , guy_radius)
toc

end
