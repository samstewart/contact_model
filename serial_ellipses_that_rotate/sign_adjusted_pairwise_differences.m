function w = sign_adjusted_pairwise_differences(q, v)
% Let e_ij be the unit vector (q_i - q_j) / |q_i - q_j|. 
% This linear operator takes a 2N length vector  and gives back N(N - 1)/2 vector defined as (for i < j) m_ij = e_ij \cdot (q'_i - q'_j) for i < j.
n = size(q, 1);
w = zeros(n*(n - 1) / 2, 1);

k = 1;
for i = 1:n 
    for j = 1:n 

        % calculate translation normal  
        u = unit_vector(q(i) - q(j));
        
        v_diff = v(i) - v(j);
        
        % now v(k) = u . (q_i - q_j)
	% complex dot
        w(k) = real(u * conj(v_diff));
        k = k + 1;
    end
end

end
