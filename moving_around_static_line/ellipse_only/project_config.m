function closestConfig = project_config(config, stationaryConfig)
% follow the gradient flow of the distance function
best_overlap_part = Inf;
best_distance_part = Inf;
% try small ball of positions
if overlap(config, stationaryConfig) > 0 

	best_config = config;

	for p = [roots_of_unity(4) 0]
	       for r = .01 * (-2:2) 
		       		
				potential_config = translation(.05 * p) * config;
				% modify just the rotation (the problem is the group structure)
				% new way to think about energy: as probability from statistical physics exp(-E(config))
				potential_config(1,1) = exp(i * r) * potential_config(1,1);

				cost1 = overlap_of_configurations(potential_config, stationaryConfig) +  distance_between_configurations(config, potential_config) ;
				cost2 = overlap_of_configurations(best_config, stationaryConfig) + distance_between_configurations(config, best_config) ;
				% in a very small neigbhorhood, distance_between_configurations will be *small*? Again comes from the incremental nature of the algorithm.
				if cost1 < cost2 
					best_config = potential_config;

				end
		end
	end
	
	closestConfig = best_config;

else
	closestConfig = config;
end
end
