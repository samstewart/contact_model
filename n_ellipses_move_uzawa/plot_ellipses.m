function plot_ellipses(ellipses)
ps = points_on_boundary(ellipses, 5, 5, 100);

for i = 1:size(ps, 1)
	line(real(ps(i, :)), imag(ps(i, :)))
end

end
