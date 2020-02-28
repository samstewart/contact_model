function legal_q = project_to_legal_position(q_0, q, radius)
% the legal configuration space is
% 	Q = { q | |q_i - q_j| >= 2r }
% This projects to tangent space T_{q_0} Q. The tangent space comes from Taylor series approximation to the norm.
% q, q_0 are column vectors of complex coordinates.
% obstacles: two -

q = complex_to_column_vector(q);
q_0 = complex_to_column_vector(q_0);

n = size(q, 1);

% todo: combine these into one
diff_matrix = difference_matrix(q_0);
%obs_matrix = obstacle_matrix(q_0);
%constraint_matrix = [diff_matrix; obs_matrix];

b = -2*radius*ones(size(diff_matrix, 1), 1); % compute the RHS after the Taylor series expansion and see \nabla D_ij(q) - D_ij(q)

% todo: fix everything so I don't have trouble with signs.
%b = [b; (10 - radius) * ones(size(obs_matrix, 1), 1)];

%-- this is simply -2r since we are substracting the linear part of D_ij and leaving the constant term? Or is there a better reasong for this?

% the quadratic form is 1/2 |q - q|^2 = 1/2 q H q + q^T(-q) + C
% We ignore the constant since it doesn't change the solution to the
% optimization problem. The leading terms are q_1^2 + q_2^2 + ...
% and the linear terms are given by <q, -q>.
% In order:
% 1) the matrix for the quadratic terms in the objective function
% 2) the vector for the linear terms in the objective function
% 3) The matrix A such that A * q <= b
% 4) The vector b such that A * q <= b
opt = optimset('Display', 'off');
[legal_q fval eflag output lambda] = quadprog(eye(n), -q, -diff_matrix, b, [], [], [], [], [], opt);

legal_q = column_vector_to_complex(legal_q);
end
