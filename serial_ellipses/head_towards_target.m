function v = head_towards_target(c, target, speeds)
	n = size(c, 1);
	v = zeros(2 * n, 1);
	direction = safe_norm(target - c(:, 2));
	v(1:2:end) = speeds .* direction;
	v(2:2:end) = 0;
end


