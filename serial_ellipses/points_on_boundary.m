function ps = points_on_boundary(ellipses, n)
ps = points_on_boundary_in_interval(ellipses, linspace(0, 2*pi, n));
end
