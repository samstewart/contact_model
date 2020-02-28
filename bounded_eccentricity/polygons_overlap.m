function overlap = polygons_overlap(pA, pB)
	overlap = abs(min_overlap_edge_normal(pA, pB)) > 1e-8;
end
