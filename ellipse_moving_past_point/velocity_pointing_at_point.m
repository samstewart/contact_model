function v = velocity_pointing_at_point(q, targets, speeds)
    	% computes a velocity field with 'speed' point at 'point'
   
	direction_vectors = targets - q;

	% kill velocity for guys who are close
	direction_vectors(abs(direction_vectors) < 1/2) = 0;

	direction_vectors = direction_vectors ./ abs(direction_vectors);

	% fix the divide by zero errors
	direction_vectors(isnan(direction_vectors)) = 0;	
       	

	v = speeds .* direction_vectors;
    
end
