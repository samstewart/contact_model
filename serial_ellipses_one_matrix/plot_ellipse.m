function plot_ellipse(c, desired_v)
t = linspace(0, 2*pi, 20);
a = 6;
b = 5;
std_ellipse = @(t)  a * cos(t) + i * b * sin(t);
Tpoint = @(q, c) c(1)*q + c(2);
e1 = @(t) Tpoint(std_ellipse(t), c);

ps = e1(t);
line(real(ps), imag(ps));
% cross to show rotation
%ps = [Tpoint(-a, c) Tpoint(a, c)];
%line(real(ps), imag(ps));
%ps = [Tpoint(-b*i, c) Tpoint(b*i , c)];
%line(real(ps), imag(ps));

% try to show desired velocity
%ps = [0 20*desired_v] + c(2) ;
%line(real(ps), imag(ps), 'Color', 'r');

end


