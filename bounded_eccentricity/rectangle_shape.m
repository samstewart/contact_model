function rect = rectangle_shape(center, w, h)
	rect = center + [- w/2 - h/2*i; w/2 - h/2 * i; w/2 + h/2 * i; -w/2 + h/2 * i];
end
