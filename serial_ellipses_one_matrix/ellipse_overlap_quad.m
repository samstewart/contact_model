function overlap = ellipse_overlap_quad(e1, e2)
A = quadratic_form_for_ellipse(e1);
B = quadratic_form_for_ellipse(e2);

roots = eig(inv(A) * B);

isreal = roots == conj(roots);

% see if they are separate (two distinct real roots)
overlap = all(roots(isreal) > 0);
end
