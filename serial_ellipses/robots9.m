axis(1/2*[-20 20 -20 20])
c1 = [1 0];
c2 = [1 10.5];

for t = 1:200
	cla
	plot_ellipses([c1; c2])
	[p1, p2, n1, n2] = robots_two_point_ellipse_dist(6, 5, c1, c2);
	ps = [p1 p2];
	line(real(ps), imag(ps), 'Color','r')
	c2(2) = c2(2) - .1i	
	pause(.4)
end
