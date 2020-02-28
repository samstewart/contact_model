function n = normal_vector_between_ellipses(n1, n2, i, j, p1, p2)

n = zeros(n, 1);
u = p1 - p2;

n(i) = -n1;
n(j) = -n2;

end
