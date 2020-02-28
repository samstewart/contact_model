function u = unit_vector(u)
if abs(u) > 0
	u = u / abs(u);
else
	u = 0;
end
end
