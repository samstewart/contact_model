function transform = affine_transformation_that_resolves_collision(n_rotations, polygonA, polygonB)

	% could rewrite all this code functionally so that we take the cross product of all possible rotations and apply them to polygonA and polygonB, then compute the minimum overlaps, then take the min.

	% find the rotations for A and B that requires the minimum translation movement to resolve the collision.
	% todo: rewrite all code so that we can easily compose affine transformations
	rotations = roots_of_unity(n_rotations);	
	best_translation = Inf + i*Inf;	
	best_rotA = 1;
	best_rotB = 1;

	% Q: is it enough to shuffle the rotations once? I don't think that's uniformly random.
	for rotA = shuffle(rotations)
		for rotB = shuffle(rotations)
%			figure;
%			draw_polygons( [rotate_polygon(polygonA, rotA), rotate_polygon(polygonB, rotB)] )
%			
			translation_to_fix_collision = min_overlap_edge_normal(rotate_polygon(polygonA, rotA), rotate_polygon(polygonB, rotB));
%			title(translation_to_fix_collision)
%			xlabel(num2str(rotA))
%			ylabel(num2str(rotB))

%			centerA = centers_of_mass_of_polygons(polygonA);
%			draw_arrow(centerA, centerA + translation_to_fix_collision)

			if abs(translation_to_fix_collision) < abs(best_translation)
				best_translation = translation_to_fix_collision;
				best_rotA = rotA;
				best_rotB = rotB;
			end
		end
	end

	transform = [best_rotA 1/2*best_translation; best_rotB -1/2*best_translation]; 

end
