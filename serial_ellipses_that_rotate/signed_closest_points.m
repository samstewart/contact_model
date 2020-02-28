function [p1, p2, n1, n2] = signed_closest_points(e1, e2, center1, center2, inf_arc_length, n1, n2)

t1 = pi/4;
t2 = pi/4;


for m = 1:5

%draw_setup(t1, x1, xprime1, center1, center2(t2));
%draw_setup(t2, x2, xprime2, center2, center1(t1));

delta_t1 = compute_delta_t(t1, e1, inf_arc_length, center1, center2(t2));
delta_t2 = compute_delta_t(t2, e2, inf_arc_length, center2, center1(t1));
t1 = t1 + delta_t1;
t2 = t2 + delta_t2;
%pause(2)
end

p1 = e1(t1);
p2 = e2(t2);
n1 = n1(t1);
n2 = n2(t2);

end


