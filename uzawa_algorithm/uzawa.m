function [u1, lambda1] = uzawa()

rho = 1.9;

desired = 1 + 2i;

lambda1 = 1;
u1 = real(desired) + i*(imag(desired) - lambda1)

lambda2 = max(lambda1 + rho * imag(u1));

u2 = real(desired) + i*(imag(desired) - lambda2)

while abs(u1 - u2) > 1e-4

	lambda1 = max(lambda2 + rho * imag(u2));

	u1 = real(desired) + i*(imag(desired) - lambda1)

	lambda2 = max(lambda1 + rho * imag(u1));

	u2 = real(desired) + i*(imag(desired) - lambda2)

end
end
