function draw_vel(config, vel)
vel(1,2) = 50 * vel(1,2);
newPos = vel * config;

l = [config(1,2) newPos(1,2)];
line(real(l), imag(l), 'Color', 'g', 'LineWidth', 2);
end
