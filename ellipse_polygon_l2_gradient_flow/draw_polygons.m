function draw_polygons(polygons)
cla;
axis square;
axis([-20 20 -20 20])
hold on;

for i = 1:size(polygons, 2)
	fill(real(polygons(:, i)), imag(polygons(:, i)), 'r')		
end

hold off;
end
