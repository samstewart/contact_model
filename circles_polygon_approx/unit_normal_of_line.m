function normal = unit_normal_of_line(p1, p2)
normal = p2 - p1;
% rotate 90 degrees
normal = -i * normal;

% normalize 
normal = normal / abs(normal);

end
