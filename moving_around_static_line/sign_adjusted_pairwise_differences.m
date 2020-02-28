function v = sign_adjusted_pairwise_differences(q, q_prime)
% Let e_ij be the unit vector (q_i - q_j) / |q_i - q_j|. 
% This method computes a vector (one entry for every pair (ij) -- in this
% case a contact between two circles): e_ij \cdot (q'_i - q'_j) for i < j.
% In other words, it computes the difference ensuring that the distance is nonnegative if q_prime is close to q.
n = size(q, 1)/2;
v = zeros(n*(n - 1) / 2, 1);

k = 1;
for i = 1:2:(2*(n - 1))
    for j = (i + 2):2:(2*n)

        % calculate $e_ij
        u = unit_vector(q(i:(i + 1)) - q(j:(j + 1)));
        
        
        q_prime_diff = q_prime(i:(i + 1)) - q_prime(j:(j + 1));
        
        % now v(k) = u . (q_i - q_j)
        v(k) = dot(u, q_prime_diff);
        k = k + 1;
    end
end

end
