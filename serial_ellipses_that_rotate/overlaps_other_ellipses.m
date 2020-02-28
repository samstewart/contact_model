function overlaps = overlaps_other_ellipses(me, others)
overlaps = false;

for m = 1:size(others, 1)
	if ellipses_overlap(me, others(m, :))
		overlaps = true;
		break
	end
end

end
