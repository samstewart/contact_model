function q = grid_project_to_legal_position(q, obstacles, short_radius, long_radius, step_size)
n = size(q, 1);

% todo: allow user to set who moves and who doesn't. then distance matrix doesn't have to be only for agents.
total_iterations = 0;
max_iterations = 6000;

illegal_q = find_illegal_positions(q, obstacles, radius);

while length(illegal_q) > 0 & total_iterations < max_iterations 
	% move each of the guys in a direction to resolve the collision
	% randomly order the updates to break any emergent symmetry
	% note: we sample in this way because of a sublte bug when illegal_q has length 1 (see documentation)
	random_position_to_fix = illegal_q(randsample(length(illegal_q), 1)); 

	% note: how we update here (batch versus one by one) matters or not?
	q(random_position_to_fix) = better_position_towards_legal_configuration(random_position_to_fix, q, obstacles, radius, step_size);
	
	total_iterations = total_iterations + 1;	

	illegal_q = find_illegal_positions(q, obstacles, radius);

end

if total_iterations >= max_iterations 
	total_iterations
	disp('hit cap')
end
end
