function p = plot_ellipses(ellipses)
ps = points_on_boundary(ellipses, 100);

for i = 1:size(ps, 1)
	p(i) = line(real(ps(i, :)), imag(ps(i, :)));
end

end
