function p = char_poly_of_ellipse(e1, e2)
A = quadratic_form_for_ellipse(e1)
B = quadratic_form_for_ellipse(e2)
det(A)
det(B)
x = [3 0 1]';
x' * B * x
x' * A * x

p = -charpoly(inv(A) * B);
end
