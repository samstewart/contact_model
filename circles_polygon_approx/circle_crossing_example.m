function circle_crossing_example(n, big_circle_radius)
% n = 2k number of antipodal points equally spaced around the circle
% radius: the agents are spaced around a circle with this radius.
% points around a circle
initial_positions = transpose(big_circle_radius * roots_of_unity(n));
ellipses = zeros(n, 2);
ellipses(:, 1) = 1;
ellipses(:, 2) = initial_positions;

% velocity points inwards on the circle
% same velocity
%speeds = .2 * ones(n, 1);

speeds = .04  + .02 * rand(n, 1);

tic
fun_simulation(ellipses, [], @(ellipses) velocity_pointing_at_point(ellipses(:, 2), -initial_positions, speeds), 1, 1)
toc

end
