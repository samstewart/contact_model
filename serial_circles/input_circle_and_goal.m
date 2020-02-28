function [center, goal] = input_circle_and_goal()
axis([-20 20 -20 20]);
axis square;
hold on;
[x,y] = ginput(1);

center = x + i * y;
viscircles([x y], 1);

[x,y] = ginput(1);
goal = x + i * y;
scatter(x, y, 20, 'filled') 
hold off;
end
