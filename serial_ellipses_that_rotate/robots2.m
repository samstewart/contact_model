

daspect([1 1 1]);
axis([-20 20 -20 20]);
%robots_proj_point_standard(4, 2, [3; 0])

cla
p = 0;
c1 = [1 0];
%[w1, w2, d] = rob_dist_ellipses([1 12], [1 4.82 + 7.7i], 5, 6)
%c1 = [1 12]; 
%c2 = [1 4.82 + 7.7i];
%ps = [0; w1];
cla
%line(real(ps), imag(ps), 'Color', 'r');
%pause(10)
p = 15 + 12i;
c = [1 0];
p
p1 = robots_transform_point_to_standard(c, p)
p2 = robots_transform_point_from_standard(c, p1, p1)
robots_proj_point([1 0], 5, 6, 6)

for t = 2:200
	cla
plot_ellipses(c);
%p = 4 + 11i;

w2 = robots_proj_point(c, 5, 6, p);
line(real([p w2]), imag([p w2]), 'Color', 'r');
p = p - .3;
pause(.1)
%axis([-3 + real(c1(2)) 10 + real(c1(2)) 0 10]);
%c1 = random_project(c1 + [0 .01], [1 12], 20 + 1i, 0, 0);
drawnow;
%writeVideo(v, getframe(gca)); 
end
%    plot_ellipses([c1; c2]);
%for t = 2:800
%    cla;
%
%    % draw the guys
%%[w1, w2] = between(c1, c2, 5, 6);
%
%% c1 = c1 + [0 .01];
%
%pause(.05)
%   drawnow;
%end


