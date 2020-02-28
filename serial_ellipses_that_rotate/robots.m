v = VideoWriter('distane_function.avi')
v.Quality = 25; % much better file sizes!
v.FrameRate = 24;
open(v)
set(gca, 'nextplot', 'replacechildren');



daspect([1 1 1]);
axis([-20 20 -20 20]);
a = 5;
b = 6;

cla
p = 0;
c1 = [1 0];
c2 = [1 12];
%[w1, w2, d] = rob_dist_ellipses([1 12], [1 4.82 + 7.7i], 5, 6)
%c1 = [1 12]; 
%c2 = [1 4.82 + 7.7i];
%ps = [0; w1];
cla
%line(real(ps), imag(ps), 'Color', 'r');
plot_ellipses([c1; c2])
%pause(10)
for t = 2:200
	cla
plot_ellipses([c1; c2]);
%p = 4 + 11i;

[w1, w2, d] = rob_dist_ellipses(c1, c2, a, b);
ps = [w1; w2];
line(real(ps), imag(ps), 'Color', 'r');


c = 'b';
if d < 0
	c = 'r';
end
ps = [w1; w2];
line(real(ps), imag(ps), 'Color', c);

%axis([-3 + real(c1(2)) 10 + real(c1(2)) 0 10]);
%c1 = random_project(c1 + [0 .01], [1 12], 20 + 1i, 0, 0);
c1 = c1 + [0 .05 + .05i];
%drawnow;
writeVideo(v, getframe(gca)); 
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

close(v)

