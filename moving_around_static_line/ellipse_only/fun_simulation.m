function fun_simulation() 
% q_0: the current position (should be legal) in complex coordinates. so 1xn vector of complex coordinates
% desired_v: a function returning the desired velocity (as a column vector of complex numbers) 

h = .5;

configMoving = translation(4.1 + .6i) * rotation(3*pi/4);

% desired_v = @(config)  translation(.05 * exp(i * 3*pi/4) * h);

%configMoving = translation(5.2);
%desired_v = @(config) translation(-.01 * h);
% how can you see the affine space reflected in the properties of the affine transformation?
for t = 1:7000

end

configMoving
end     
