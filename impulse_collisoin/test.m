
x = zeros(2, 2);
v = zeros(2, 2);

epsilon = .01;
%a = @(t) 2;
a =-.1; 
dt = .5;

vd = VideoWriter('circle.avi')
vd.Quality = 100;
vd.FrameRate = 24;
open(vd)
set(gca, 'nextplot', 'replacechildren');


axis([-20 20 -20 20])
axis square
times = dt*(0:200);
x = [11 + 1i; 0];
v = [-.1 + .09i; 0];

hold off

path = zeros(length(times), 1);

path(1) = x(1);

for k = 2:length(times) 

	if abs(x(1) + dt * v(1) - (x(2) + dt * v(2))) <= 10
		% they overlap, so add the impulse force
		for m = 1:1
		F = -1/2 * [v(1) - v(2); v(2) - v(1)];
%Jk r		v = v + dt/5 * F
		end
		v = v + dt * F;
%		v(1) = (v(1) + v(2))/2;
%		v(2) = (v(1) + v(2))/2;
	else
		v = [-.1 + .09i; 0];
	end	
		% the usual time stepping
		x = x + dt * v;

	x(1)	
	path(k) = x(1);

	cla;

	path_subset = path(1:k);
	line(real(path_subset), imag(path_subset))

	viscircles([real(x) imag(x)], [5; 5]);

   writeVideo(vd, getframe(gca)); 
%	drawnow
end

close(vd)
