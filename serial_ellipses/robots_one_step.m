function [w, t, delta_t] = robots_one_step(a, b, t, p)
	t = t + robots_compute_delta_t(a,b,t,p); % when should this by + delta vs - delta?
        t = min(pi/2, max(0, t));
	w = robots_point_on_ellipse(a,b,t);
end
