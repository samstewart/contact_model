function w = pairwise_distances(v)
n = length(v) / 2;
% returns N(N - 1)/2 vector of all distances abs(v_i - v_j)
w = zeros(n*(n - 1) / 2, 1);
k = 1;

for i = 1:2:(2*(n - 1))
    for j = (i + 2):2:(2*n)
        % now v(k) = u . (q_i - q_j)
        w(k) = l2_norm(v(i:(i + 1)) - v(j:(j + 1)));
        k = k + 1;
    end
end


end
