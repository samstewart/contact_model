function n = normal_to_ellipse(c, a, b, theta)
n = [b * cos(theta);  a * sin(theta)];
n = n / norm(n);

end
