function w = sign_adjusted_pairwise_differences(q, v)
% Let e_ij be the unit vector (q_i - q_j) / |q_i - q_j|. 
% This linear operator takes a 2N length vector  and gives back N(N - 1)/2 vector defined as (for i < j) m_ij = e_ij \cdot (q'_i - q'_j) for i < j.
n = size(q, 1)/2;
w = zeros(n*(n - 1) / 2, 1);

k = 1;
for i = 1:2:(2*(n - 1))
    for j = (i + 2):2:(2*n)

        % calculate $e_ij
        u = unit_vector(q(i:(i + 1)) - q(j:(j + 1)));
        
        
        v_diff = v(i:(i + 1)) - v(j:(j + 1));
        
        % now v(k) = u . (q_i - q_j)
        w(k) = dot(u, v_diff);
        k = k + 1;
    end
end

end
