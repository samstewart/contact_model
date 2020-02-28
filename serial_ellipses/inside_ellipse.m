function is_inside = inside_ellipse(ellipse, p)
a = 6;
b = 5;
normalized_point = 1/ellipse(1) * (p - ellipse(2));

is_inside = real(normalized_point).^2/a^2 + imag(normalized_point).^2/b^2 - 1 < 0; 
end
