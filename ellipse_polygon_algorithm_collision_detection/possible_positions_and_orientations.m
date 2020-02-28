function moves = possible_positions_and_orientations(ellipse, n_positions, n_orientations, position_step_size)
% we look in a small ball around the current point in the configuration space 

% the matrix multiplication applies each of the configurations from the small ball around the current configuration
% key idea is to think of ellipse in world space as *transformation*
sphere_samples = points_on_two_sphere(n_orientations, n_positions);

% add the configurations where we don't translate, and only rotate
sphere_samples = [sphere_samples; cartesian_product(roots_of_unity(n_orientations), [0])];

transformations = [sphere_samples(:, 1) ones(size(sphere_samples, 1), 1) (position_step_size * sphere_samples(:, 2))];
% the strange form of this matrix is just so that we apply the rotation to the orientation of the ellipse and the translation to the translation part of the ellipse. Is there a way to clean this up? I think we have messed up the permutation of the 1 column: if we are working in projective space then let's keep the ones at the end. We are combining affine (linear in projective space) transformations 

moves = transformations * [ellipse(1) 0; 0 ellipse(2); 0 1];
end
