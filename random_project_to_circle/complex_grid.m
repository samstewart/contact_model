function grid = complex_grid(reals, imags)
grid = zeros(size(length(imags), length(reals)));

for k = 1:length(imags)
	for j = 1:length(reals)
		grid(k, j) = reals(j) + i * imags(k);
	end
end
end
