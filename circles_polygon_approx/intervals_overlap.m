function overlaps = intervals_overlap(intervalsA, intervalsB)
	% compute the shift amount we need to move intervalA out of intervalB (do we need to assume that intervalA is not contained in intervalB)? 
	overlaps = zeros(size(intervalsA, 1), 1);

	% there are two cases depending on the endpoints
	endpointA_smaller = intervalsA(:, 1) < intervalsB(:, 1);
	endpointB_smaller = ~endpointA_smaller;

	overlaps(endpointA_smaller) = min(intervalsB(endpointA_smaller, 1) - intervalsA(endpointA_smaller, 2), 0);
	overlaps(endpointB_smaller) = min(intervalsA(endpointB_smaller, 1) - intervalsB(endpointB_smaller, 2), 0);

end
