% test finding distance between two ellipses
cla
clear i
c1 = [1 0];
c2 = [1 9];
[p1, p2] = robots_two_point_ellipse_dist(6, 5, c1, c2)
p1
p2
line(real([p1 p2]), imag([p1 p2]), 'Color', 'r')
plot_ellipses([c1; c2])


