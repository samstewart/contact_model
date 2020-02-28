cla
a = 6;
b = 5;
c = [1 0];
axis(1/2*[-20 20 -20 20])

theta = linspace(0,2*pi, 100);
evolute = (a^2 - b^2) * (cos(theta).^3 / a - i * sin(theta).^3 / b);

x = a * cos(theta) + i *b * sin(theta);
line(real(evolute), imag(evolute))
line(real(x), imag(x))

for j = 1:length(theta)
	normal = (a^2 - b^2) * (-3/a * cos(theta(j))^2 * sin(theta(j)) - i * 3/b * sin(theta(j))^2 * cos(theta(j)));
	ps = [evolute(j) evolute(j) - 100*normal];
	line(real(ps), imag(ps))
end
return
for theta = linspace(0, pi/2, 4)
	x = a * cos(theta) + i *b * sin(theta);
	n = evolute - x;
        n = n / abs(n);	
	endp = x + 9*n;
	line(real([x endp]), imag([x endp]), 'Color', 'r')
end
