function [configs, goals] = input_ellipses(n)
configs = zeros(n, 2);
goals = zeros(n, 1);

for k = 1:n
	[config, goal] = input_ellipse_and_goal();

	configs(k, :) = config;
	goals(k) = goal;
end
end
