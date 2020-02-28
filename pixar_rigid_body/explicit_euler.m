function x_new = explicit_euler(x, dx_dt, dt, t)
x_new = x + dx_dt(x, t) * dt;
end
