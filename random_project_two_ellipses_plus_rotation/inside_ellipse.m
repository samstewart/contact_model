function is_inside = inside_ellipse(ellipse, p, short, long)
x0 = real(ellipse(2));
y0 = imag(ellipse(2));

x = real(p);
y = imag(p);
is_inside = (x - x0).^2/short^2 + (y - y0).^2/long^2 - 1 < 0; 
end
