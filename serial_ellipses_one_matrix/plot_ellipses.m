function p = plot_ellipses(c, v)
for l = 1:size(c, 1)
	plot_ellipse(c(l, :), v(l));
	p1 = c(l, 2);
%	text(real(p1), imag(p1), int2str(l))
end

end
