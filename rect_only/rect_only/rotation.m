function M = rotation(rot)
M = [exp(i*rot) 0; 0 1];
end
