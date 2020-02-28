function overlaps = intervals_overlap(intervalA, intervalB)
% see if there is an overlap at all
if intervalA(2) < intervalB(1) || intervalB(2) < intervalA(1)
	overlaps = 0;
else
	overlaps = min(abs(intervalA(2) - intervalB(1)), abs(intervalA(1) - intervalB(2)));
end
end
