function d = complex_dot(z1, z2)
d = real(sum(z1 .* conj(z2)));
end
