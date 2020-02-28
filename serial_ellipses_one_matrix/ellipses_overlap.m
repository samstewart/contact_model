function overlap = ellipses_overlap(e1, e2)
overlap = any(inside_ellipse(e1, points_on_boundary(e2, 26)));
overlap = overlap || any(inside_ellipse(e2, points_on_boundary(e1, 26)));
end
