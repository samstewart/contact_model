function configMoving = do_steps(configMoving, n)

positions = zeros(n, 1);

for i = 1:n

	positions(i) = configMoving(1,2);
	configMoving = do_step(configMoving);
	subplot(2,2,2);

	cla;
	axis auto;
	line(real(positions(1:i)), imag(positions(1:i)))
	drawnow
end

end
