%v = VideoWriter('three_ellipses_not_stuck.avi')
%v.Quality = 25; % much better file sizes!
%v.FrameRate = 24;
%open(v)
%set(gca, 'nextplot', 'replacechildren');


axis([-100 100 -100 100])
c1 = [1 -6; 1 6; 1 12i; ];
goals1 = [20 + 1i; -20 - 1i; -20i + 1; ];

c2 = c1;
c3 = c1;
c2(:, 2) = c2(:, 2) + 30 + 1i;
c3(:, 2) = c3(:, 2) - 30 - 20i;
c = [c1; c2; c3];
goals = [goals1; goals1 + 20; goals1 - 20]
%ps = [0; w1];
cla
%line(real(ps), imag(ps), 'Color', 'r');
for t = 2:200
	cla
plot_ellipses(c);
%%p = 4 + 11i;

for m = shuffle(1:size(c, 1))
c(m, :) = random_project(c(m,:), delete_row(m, c), goals(m), 0, 0);
end
%writeVideo(v, getframe(gca))
drawnow;
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

%close(v)

