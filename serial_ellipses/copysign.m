function v = copysign(v, w)
v = sign(w) .* abs(v);
end
