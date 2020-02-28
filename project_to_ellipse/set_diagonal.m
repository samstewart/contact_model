function M = set_diagonal(M, diag)

for i = 1:min(size(M))
	M(i,i) = diag(i);
end

end
