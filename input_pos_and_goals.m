function [center, goal] = input_circle_and_goal()
[x,y] = ginput(1);

center = x + i * y;
viscircle([x y], 5);

[x,y] = ginput(1);
goal = x + i * y;
scatter(x, y, 20, 'filled') 

end
