function c = delete_row(k, c)
if k == 1
	c = c(2:end, :);
else
	c = [c(1:(k - 1), :); c((k + 1):end, :)];
end
end
