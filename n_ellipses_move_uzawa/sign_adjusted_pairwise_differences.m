function w = sign_adjusted_pairwise_differences(normals, v) 
% return: dot(normals_i, v_i - v_j) j > i
n = length(v);
w = zeros(n*(n - 1) / 2, 1);

k = 1;
for i = 1:n
    for j = 1:n
	if j > i 
		w(k) = real(normals(k) * conj(v(i) - v(j))); % can think of this as relative velocity of ellipse i to j

		k = k + 1;  
	end
    end
end

end
