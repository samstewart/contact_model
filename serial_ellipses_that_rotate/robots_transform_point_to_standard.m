function p = robots_transform_point_to_standard(c, p)
p = i/c(1) * (p -  c(2)); % rotate ellipse to align long axis with x-axis 
p = [real(p); imag(p)];
end
