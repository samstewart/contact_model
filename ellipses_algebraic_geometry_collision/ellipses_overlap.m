function overlap = ellipses_overlap(e1, e2)
overlap = any(inside_ellipse(e1, points_on_boundary(e2, 1000)));
end
