function points = points_on_two_sphere(n1, n2)
points = cartesian_product(roots_of_unity(n1), roots_of_unity(n2));
end
