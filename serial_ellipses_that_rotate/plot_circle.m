function plot_circle(q, R)
t = linspace(0, 2*pi, 100);
circ = @(t)  R* ( cos(t) + i *  sin(t)) + q;

ps = circ(t);
line(real(ps), imag(ps));
end


