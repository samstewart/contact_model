function roots = roots_of_unity(n)
roots = exp(2 * pi * (0:(n - 1)) ./ n * i);
end
