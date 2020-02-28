function overlaps = overlaps_over_ellipses(k, c, cp)
overlaps = zeros(size(c, 1), 1);

for m = 1:size(c, 1)
	overlaps(m) = ellipses_overlap(c(m, :), cp);
end

overlaps(k) = false; % can't overlap itself

overlaps = any(overlaps);
end
