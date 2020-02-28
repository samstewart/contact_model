cla;
% test projecting a point onto an ellipse
axis([-10 10 -10 10]);
robots_proj_point_standard(6, 5, [1; 6])
%robots_compute_delta_t(6, 5, 1.1957, [3;6])

% want to make sure that the vector field for gradient descent has stable equilbria. It is crucial to use the cross product because it tracks orientation (unlike the dot product) and thus makes the equilibria stable.
delta_ts = zeros(1, 101);
return 
t0 = 1.1957
ts = (-50:50)*pi/50 + t0;
ts = linspace(t0-.40, t0+.40, 101);
for i = 1:101
	delta_ts(i) = robots_compute_delta_t(6, 5, ts(i), [3;6]);
end

plot(ts, delta_ts)
