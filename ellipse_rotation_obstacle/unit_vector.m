function u = unit_vector(v)
    % normalizes a 2n x 1 vector representing a flattened list of n
    % vectors. If it finds a zero vector, it leaves it.
    n = size(v, 1) / 2;
    
    u = zeros(size(v));
    

    for i = 1:2:(2*n)
        % normalizes a vector if nonzero. If zero, returns zero.
        
        v1 = v(i:(i + 1));
        
        if norm(v1) > 1e-10
            
            u(i:(i + 1)) = v1 ./ norm(v1);
        
        end

    end


end