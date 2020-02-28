function closestConfig = project_config(config, stationaryConfig)

% follow the gradient flow of the distance function


directions1 = .05 * [roots_of_unity(8) 0];
rotations1 = .001 * (-30:30);

[directions, rotations] = meshgrid(directions1, rotations1);

distance_scores = arrayfun(@(dR, dT) distance_between_configurations(perturbation_of_transformation(config, dR, dT), config), rotations, directions);

alignment_scores = arrayfun(@(dR, dT) deviation_from_velocity(perturbation_of_transformation(config, dR, dT)), rotations, directions);

overlap_scores = arrayfun(@(dR, dT) overlap(perturbation_of_transformation(config, dR, dT), stationaryConfig), rotations, directions);

scores = 20*overlap_scores + distance_scores + alignment_scores; 

[min_v, min_i] = min_index_of_matrix(scores);

desired_rotation = rotations(min_i(1), min_i(2));
desired_translation = directions(min_i(1), min_i(2));

closestConfig = perturbation_of_transformation(config, desired_rotation, desired_translation);

end
