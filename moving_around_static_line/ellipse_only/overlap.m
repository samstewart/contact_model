function d = overlap(c1, c2)
% not sure how necessary this symmetrization is?
d = min(overlap_of_configurations(c1, c2), overlap_of_configurations(c2, c1));
end
