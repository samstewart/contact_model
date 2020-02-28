function w = robots_proj_two_point_standard(semi_major, semi_minor, p)

    px = abs(p(1));
    py = abs(p(2));

    t = pi / 4;

    a = semi_major;
    b = semi_minor;

    for x = 1:4
        x = a * cos(t);
        y = b * sin(t);

        ex = (a*a - b*b) * cos(t)^3 / a;
        ey = (b*b - a*a) * sin(t)^3 / b;

        rx = x - ex;
        ry = y - ey;

        qx = px - ex;
        qy = py - ey;

        r = hypot(ry, rx);
        q = hypot(qy, qx);

        delta_c = r * asin((rx*qy - ry*qx)/(r*q));
        delta_t = delta_c / sqrt(a*a + b*b - x*x - y*y);
	delta_t
        t = t + delta_t;
        t = min(pi/2, max(0, t));
    
    end
    w = [copysign(x, p(1)), copysign(y, p(2))];
end

function v = copysign(v, w)
v = sign(w) .* abs(v);
end
