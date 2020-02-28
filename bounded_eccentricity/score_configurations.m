function score = score_configurations(polygonA, polygonB, configuration, desired_configuration)

score = dist_between_configurations(configuration, desired_configuration) + overlap_between_configurations(polygonA, polygonB, configuration(1, :), configuration(2, :));

end
