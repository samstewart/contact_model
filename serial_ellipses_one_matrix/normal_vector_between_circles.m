function n = normal_vector_between_circles(q, i, j)

n = zeros(length(q), 1);
u = q(i) - q(j);
u = u / abs(u);

n(i) = u;
n(j) = -u;

end
