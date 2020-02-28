
function roots = roots_of_unity(n)
primitive_root = exp(2 * pi / n * i);

roots = primitive_root .^ (0:(n - 1));

end
