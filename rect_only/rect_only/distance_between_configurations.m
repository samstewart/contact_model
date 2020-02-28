function d = distance_between_configurations(c1, c2)
% good weights (2e5, 1e5)
%d = 4e6*abs(c1(1, 2) - c2(1, 2))^2 + .001*abs(angle(c1(1, 1) / c2(1,1)))^2;
R = 0; % line
d = abs(c1(1,2) - c2(1,2)) + R * abs(angle(c1(1,1) / c2(1,1)));

% How do I use the matrix norm to induce a metric? The problem is that the operators form an *algebra*, not a vector space
%D = eig(c1 * inv(c2));
%d = max(abs(D));

end
