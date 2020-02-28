function [total_steps, p1, p2, n1, n2] = signed_closest_points(e1, e2, center1, center2, inf_arc_length, n1, n2, start1, start2)

% use the line between the centers (adjusted for relative rotations) as the starting angles (we only need to get in the two correct quadrants to avoid the other optimums / equilbria of the gradient descent) 
t1 = start1;
t2 = start2;

delta_t1 = 1;
delta_t2 = 1;

total_steps = 0;
while abs(delta_t1) + abs(delta_t2) > 1e-14 && total_steps < 10

%draw_setup(t1, x1, xprime1, center1, center2(t2));
%draw_setup(t2, x2, xprime2, center2, center1(t1));
delta_t1 = compute_delta_t(t1, e1, inf_arc_length, center1, center2(t2));
delta_t2 = compute_delta_t(t2, e2, inf_arc_length, center2, center1(t1));
t1 = t1 + delta_t1;
t2 = t2 + delta_t2;
total_steps = total_steps + 1;
%pause(2)
end
p1 = e1(t1);
p2 = e2(t2);
n1 = n1(t1);
n2 = n2(t2);

end


