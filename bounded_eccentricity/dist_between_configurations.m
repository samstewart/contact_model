function dist = dist_between_configurations(configA, configB)
% we divide the rotations to subtract the angles
rotA = configA(:, 1)
transA = configA(:, 2)
rotB = configB(:, 1)
transB = configB(:, 2)

% |a - b|^2 + |\theta_1 - \theta_2|^2
dist = sum(abs(transA - transB).^2) + sum(angle(rotA ./ rotB).^2);
end
