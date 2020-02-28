function [closest1, closest2, d] = rob_dist_ellipses(c1, c2, a, b)
n = 101; % make sure odd number
ps = points_on_boundary_in_interval(c1, linspace(-pi, pi, n));
closest1 = ps(4);
closest2 = robots_proj_point(c2, a, b, closest1);

for m = 1:n
    w1 = ps(m);
    w2 = robots_proj_point(c2, a, b, w1);
    
    d1 = inside_ellipse_signed(c2, w1) *abs(w2 - w1) ;
    d2 = inside_ellipse_signed(c2, closest1)*  abs(closest1 - closest2);
    if d1 < d2 
          closest1 = w1;
	  closest2 = w2;
    end
end

d = inside_ellipse_signed(c2, closest1)* abs(closest1 - closest2);
end

