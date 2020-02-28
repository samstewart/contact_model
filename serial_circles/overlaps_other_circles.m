function overlaps = overlaps_other_circles(k, x, xp)

overlaps = abs(x - xp) < 2 * 1;

overlaps(k) = false;

overlaps = any(overlaps);
end
