function overlap = ellipses_overlap(e1, e2, short, long)
overlap = any(inside_ellipse(e1, points_on_boundary(e2, short, long, 100), short, long));
end
