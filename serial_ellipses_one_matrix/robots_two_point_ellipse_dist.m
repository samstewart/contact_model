function [p1, p2, n1, n2] = robots_two_point_ellipse_dist(a, b, c1, c2)
    % todo: use more clever beginning values (the line between their centers?)
    v1 = c2(2) - c1(2);
    % t1 = atan2(;
    t1 = pi / 4;
    t1 = atan2(imag(v1), real(v1));
    t2 = -t1; % todo: can make better approximation by taking into account rotation of ellipse

    p1 = c1(2);
    p2 = points_on_boundary_in_interval(c2, t2);

    for n = 1:10
%	line(real([p1 p2]), imag([p1 p2]), 'Color', 'r')
%	plot_ellipses([c1; c2])

	std1 = robots_transform_point_to_standard(c1, p2);
	[p1,t1] = robots_one_step(a, b, t1, abs(std1));
	p1 = robots_transform_point_from_standard(c1, p1, std1);

    	n1 = robots_transform_vector_from_standard(c1, normal_to_ellipse(c1, a, b, t1), std1);

	std2 = robots_transform_point_to_standard(c2, p1);
	[p2,t2] = robots_one_step(a, b, t2, abs(std2));
	p2 = robots_transform_point_from_standard(c2, p2, std2);
	
    	n2 = robots_transform_vector_from_standard(c2, normal_to_ellipse(c2, a, b, t2), std2);
    end

end
