function u = unit_normal_to_rotation(config, short, long, q)

% todo: work in the rotation/translation of the ellipse
S = [1/short 0; 0 1/long];

q = real_to_complex_vector(q);

q = 1/config(1) * q;
q_rot = i * q; % see the formula for the normal vector to see why we rotate by this
q = complex_to_real_vector(q)
q_rot = complex_to_real_vector(q_rot)

% I think a sign got messed up in the computation somewhere?
u = -dot(S * q, S * q_rot);

if abs(u) < 1e-5
	u = 0;
else 
	u = u / abs(u);
end

end
