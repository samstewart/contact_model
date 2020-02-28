function w = pairwise_distances(q)
n = length(q);
w = zeros(n*(n - 1) / 2, 1);
k = 1;

for i = 1:(n - 1) 
    for j = (i + 1):n
        w(k) = abs(q(i) - q(j));
        k = k + 1;
    end
end


end
