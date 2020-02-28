axis([-20 20 -20 20])
cla
c1 = [i 1i];
c2 = [1 -15];

%[p1, p2] = signed_closest_points(e1, e2, )
[p1, p2, n1, n2] = two_point_ellipse_dist(c1, c2);

signed_distance(c1, c2, p1, p2)

ps = [p1 p1 +  n1 ];
line(real(ps), imag(ps), 'Color', 'r')

ps = [p2 p2 +  n2 ];
line(real(ps), imag(ps), 'Color', 'r')


