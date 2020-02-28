function [v_new, lambda_new] = uzawa(lambda_old, solve_unconstrained, constraint_gradient, rho)

v_new = solve_unconstrained(lambda_old);
constraint_g = constraint_gradient(v_new);

lambda_new = max(0, lambda_old + rho * constraint_gradient(v_new));

end
