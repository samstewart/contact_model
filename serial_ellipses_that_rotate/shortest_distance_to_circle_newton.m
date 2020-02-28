
%[x, n] = newtons_method(4, @(x) -2 + x^2, @(x) 2 * x, .000001);
%[x, n] = newtons_method([-1; -1], @(x) [1 -1; 1 1] * (x - [2;2]), @(x) [1 -1; 1 1], .000001);
[d, p] = d_to_circle([2; 2]);
%[d, p] = d_to_line()
function [x, n] = newtons_method(x0, F, jacob, tolerance)
x = x0;
er = Inf;
n = 1;
while n < 40
	x	
	step = inv(jacob(x))*F(x);
  	er = dot(step, step);
	x = x - step;
	n = n + 1;
end

end

function [d, p] = d_to_line()

constraint = @(p) [p(1) - 1; p(2)];
jac = @(p) eye(2);
[p, n] = newtons_method([3; 3], constraint, jac, .01) 

d = sum(abs(p));
end
function [d, p] = d_to_circle(q)

R = [0 -1; 1 0];
orthog_jacob = @(p) [(2 * p) (2 * R' * (p - q) + R * 2 * p)]';
constraint = @(p) [dot(p, p) - 1; dot(R * p, p - q)];
[p, n] = newtons_method([1; 1], constraint, orthog_jacob, .001);

d = sum(abs(p - q));
end

