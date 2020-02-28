function draw_arrow(z1,z2)
x = [real(z1) real(z2)];
y = [imag(z1) imag(z2)];

quiver( x(1),y(1),x(2)-x(1),y(2)-y(1),0 )
end
