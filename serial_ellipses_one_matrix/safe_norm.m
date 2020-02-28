function normed = safe_norm(p)
	normed = zeros(size(p));
	
	too_small = abs(p) < 1e-3;
	normed(too_small) = 0;
	normed(~too_small) = p(~too_small) ./ abs(p(~too_small));
end	


