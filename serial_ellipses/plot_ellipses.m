function p = plot_ellipses(c, v)
for l = 1:size(c, 1)
	if l <= size(c, 1)/2
		color = 'b';
	else
		color = 'r';
	end
	plot_ellipse(c(l, :), v(2*l - 1), 'b');
%	p1 = c(l, 2);
%	text(real(p1), imag(p1), int2str(l))
end

end
