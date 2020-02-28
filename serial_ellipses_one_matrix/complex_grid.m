function grid = complex_grid(reals, imags)
grid = zeros(length(imags) * length(reals), 1);
m = 1;
for k = 1:length(imags)
	for j = 1:length(reals)
		grid(m) = reals(j) + i * imags(k);
		m = m +1;
	end
end
end
