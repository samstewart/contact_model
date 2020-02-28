function correction = velocity_correction(constraints, n, h)
	correction = zeros(n, 1)
	for j = 1:n
		for k = 1:n
			constraint = constraint_normals(collision_key(j, k))	
			
			correction(j) = correction(j) + (-h * normal * lambda);
		end
	end
end
