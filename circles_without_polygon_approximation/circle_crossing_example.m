function circle_crossing_example(n, radius)
% n = 2k number of antipodal points equally spaced around the circle
% radius: the agents are spaced around a circle with this radius.
% points around a circle
q_0 = transpose(radius * roots_of_unity(n));


% velocity points inwards on the circle
% same velocity
%speeds = .2 * ones(n, 1);

speeds = .01  + .02 * rand(n, 1);

tic
fun_simulation(q_0, [], @(q) velocity_pointing_at_point(q, -q_0, speeds) , 1/2)
toc

end
