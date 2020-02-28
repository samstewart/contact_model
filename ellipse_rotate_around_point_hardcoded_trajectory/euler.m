function points = euler(x_0, dx_dt, dt, n_steps)
points = zeros(n_steps, length(x_0));
points(1, :) = x_0;

for t = 2:n_steps
	points(t, :) = points(t - 1, :) + dt * dx_dt(points(t - 1, :)) ;
end

end
