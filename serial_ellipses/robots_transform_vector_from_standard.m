function p = robots_transform_vector_from_standard(c, p, quadrant_signs)
p = copysign(p, quadrant_signs);

p = p(1) + i * p(2);

p = -i* c(1) * p;

end
