function overlap = any_quad_overlap(ellipses)
overlap = false;
n = size(ellipses, 1);

for k = 1:n
	for l = 1:n
		if k < l
			if ellipse_overlap_quad(ellipses(k, :), ellipses(l, :))
				overlap = true;
				break
			end	
		end
	end
end
end
