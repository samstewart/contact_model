function z = random_complex_numbers(n, real_range, imag_range)
z = rand(n, 2);

% looks like matrix multiplication by affine matrix. Can we rewrite it?
z(:, 1) = (real_range(2) - real_range(1)) * z(:, 1) + real_range(1); 
z(:, 2) = (imag_range(2) - imag_range(1)) * z(:, 2) + imag_range(1); 

z = z(:, 1) + i * z(:, 2);


end
