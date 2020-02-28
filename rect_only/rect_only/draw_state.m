function draw_state(c)

l = rect_from_configuration(c);
fill(real(l), imag(l), 'r');
axis([-20 20 -20 20])
end
