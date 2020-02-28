function might = could_be_overlapping(e1, e2)
% necessary condition is that distance between centers be <= sum of two longest axes
might = abs(e1(2) - e2(2)) < 2 * 6;
end
