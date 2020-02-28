function draw_ellipses(ellipses, short_radius, long_radius, n)

    hold on;
    for i = 1:size(ellipses, 1)
	    points = points_on_boundary(ellipses(i, :), short_radius, long_radius, n);
	    fill(real(points), imag(points), 'r')
    end

    hold off; 

end
