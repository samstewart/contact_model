function overlaps = intervals_overlap(intervalA, intervalB)
overlaps = zeros(size(intervalA, 1));

overlaps = min(abs(intervalA(:, 2) - intervalB(:, 1)), abs(intervalA(:, 1) - intervalB(:, 2)));
overlaps(intervalA(:, 2) < intervalB(:, 1) | intervalB(:, 2) < intervalA(:, 1)) = 0;
end
