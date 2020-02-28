function plot_point(p)
	ps = [p - 1i p + 1i];
	line(real(ps), imag(ps));
	ps = [p - 1 p + 1];
	line(real(ps), imag(ps));
end
	
