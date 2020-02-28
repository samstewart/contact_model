axis([-4 10 -10 10])
Ac1 = [1 (-10 - 5i)];
c2 = [i (15 + 10i)];

c1 = [1 0]
c2 = [1 11 + 1i];

for t = 1:200
cla
[p1, p2, n1, n2] = robots_two_point_ellipse_dist(6, 5, c1, c2);
%line(real([p1 p2]), imag([p1 p2]), 'Color', 'r');
line(real([p1 (p1 + 8*n1)]), imag([p1 (p1 + 8*n1)]))
line(real([p2 (p2 + 8*n2)]), imag([p2 (p2 + 8*n2)]))
d = signed_ellipse_dist(c1, c2, p1, p2)
plot_ellipses([c1; c2]);
c1(2) = c1(2) + .2;
c2(2) = c2(2) - .1; 
pause(2)

end

