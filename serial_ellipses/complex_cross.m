function z = complex_cross(z1, z2)
z = real(z1 * conj(-i*z2));
end
