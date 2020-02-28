function d = group_metric(g1, g2)
L = 6;
d = abs(g1(2) - g2(2)) + L * abs(angle(g1(1)/g2(1)));

end
