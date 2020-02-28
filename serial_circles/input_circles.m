function [centers, goals] = input_circles(n)
centers = zeros(n, 1);
goals = zeros(n, 1);

for k = 1:n
	[center, goal] = input_circle_and_goal();

	centers(k) = center;
	goals(k) = goal;
end
end
