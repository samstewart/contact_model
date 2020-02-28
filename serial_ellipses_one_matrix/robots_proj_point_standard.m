function w = robots_proj_point_standard(a, b, p)
    t = atan2(p(2), p(1));
    for n = 1:40
    % code for plotting normal and tangent
%	t
%	cla
%	w = robots_point_on_ellipse(a,b,t)
%	line([p(1) w(1)], [p(2) w(2)], 'Color', 'r');
%
%	alpha = 1;
%	tangent = [-a * sin(t); b * cos(t)];
%	p1 = robots_point_on_ellipse(a,b,t) + 2 * tangent;
%	p2 = robots_point_on_ellipse(a,b,t) - 2*tangent;
%	
%	dot(p - robots_point_on_ellipse(a,b,t), tangent)	
%	line([p(1) w(1)], [p(2) w(2)], 'Color', 'r');
%	line([p1(1) p2(1)], [p1(2) p2(2)], 'Color', 'r');
%	
%	plot_ellipses([i 0]);
%	pause(3);
%	drawnow

	[w,t] = robots_one_step(a, b, t, p);
    end

end


