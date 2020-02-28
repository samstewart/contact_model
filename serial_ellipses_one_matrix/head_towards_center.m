function v = head_towards_center(c)
	speeds  = 15 * ones(size(c, 1), 1) ;
	v = speeds .*(-safe_norm(c(:, 2)));
end


