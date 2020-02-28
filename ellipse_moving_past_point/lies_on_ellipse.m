function is_on = lies_on_ellipse(config, short, long, q)
q = real_to_complex_vector(q);

q = q - config(2); % translate to the origin
rotation = i * config(1);
q = rotation * q ; % rotate long axis to axis axis

c = sqrt(long^2 - short^2);
foci_1 = c;
foci_2 = -c;

d = abs(q - foci_1) + abs(q - foci_2);

is_on = d - 2 * long;  
end
