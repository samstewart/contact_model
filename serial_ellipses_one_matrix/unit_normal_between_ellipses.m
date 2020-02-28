function u = unit_normal_between_ellipses(c, i, j)
c1 = c(i, :);
c2 = c(j, :);

[p1, p2] = robots_two_point_ellipse_dist(6, 5, c1, c2);

u = unit_normal(p2 - p1)
end
