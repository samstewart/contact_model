function [config, goal] = input_ellipse_and_goal()
axis([-20 20 -20 20]);
axis square;
hold on;
[x,y] = ginput(1);

center = x + i * y;
p = plot_ellipses([1 center]);
p = p(1);

[x2,y2] = ginput(1);
newp = x2 + i * y2;
rot = (newp - center) / abs(newp - center);

config = [rot center];

% update the plot based on the rotation
p2 = plot_ellipses(config);
p.XData = p2.XData;
p.YData = p2.YData;

[x,y] = ginput(1);
goal = x + i * y;
scatter(x, y, 20, 'filled') 
hold off;
end
