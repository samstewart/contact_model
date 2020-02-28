function M = obstacle_matrix(q)
n = size(q, 1) / 2;
M = zeros(n, 2*n);

for i = 1:n
    M(i, :) = circshift(eye(1, 2*n), 2*i - 1);
end

end