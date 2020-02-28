function points = cartesian_product(v1, v2)
% is there a faster way to do this?
[x, y] = meshgrid(v1, v2);

points = [x(:), y(:)];
end
