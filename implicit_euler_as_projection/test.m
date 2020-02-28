
path1 = zeros(10, 1);
path2 = zeros(10, 1);
epsilon = .01;
%a = @(t) 2;
a =-.1; 
dt = 1;

times = dt*(0:10);
2/a
path1(1) = 1;
path2(1) = 0;

for k = 2:length(times) 
%	path1(k) = path1(k - 1) * (1 - dt * a);
%%	path1(k) = path1(k - 1) * (1 - dt * a);
	path1(k) = path1(k - 1) + -dt / epsilon * (path1(k - 1) - times(k));
	path2(k) = (path2(k - 1) + dt / epsilon * times(k)) / (1 + dt / epsilon); 
end

cla;
hold on;
subset = 1:length(times);
plot(times(subset), times(subset))
% takes 187 time steps to get within 1e-7 of the equilibrium with explicit euler
%plot(times(subset), path1(subset));
plot(times(subset), path2(subset));

hold off;

