function score = score_configuration(config, stationaryConfig)
score = 20 * overlap(c1, stationaryConfig) + distance_between_configurations(c1, c2) + .2*abs(angle(c1(1,1) / i))
end
