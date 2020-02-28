function is_inside = inside_ellipse(ellipse, p)
short = 5;
long = 6;
normalized_point = 1/ellipse(1) * (p - ellipse(2));

is_inside = real(normalized_point).^2/short^2 + imag(normalized_point).^2/long^2 - 1 < 0; 
end
