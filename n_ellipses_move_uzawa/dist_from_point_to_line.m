function d = dist_from_point_to_line(point, line_endpoint1, line_endpoint2)
% we assume this is aligned with x axis 
d = Inf;

line_length = abs(line_endpoint2 - line_endpoint1);

% we can translate and rotate the problem without changing the distance.
% 
% make line_endpoint1 the origin
distToEndpoint1 = abs(point - line_endpoint1);
distToEndpoint2 = abs(point - line_endpoint2);

newPoint = point - line_endpoint1;

% align the x-axis with the line via a rotation
lineAngle = angle(line_endpoint2 - line_endpoint1);
newPoint = newPoint * exp(-lineAngle * i);

% all the quantities here are rotation / translation invariant
if 0 <= real(newPoint) && real(newPoint) <= line_length
	% is above or below the line
	d = abs(imag(newPoint));
else
	% measure from endpoints
	d = min(distToEndpoint1, distToEndpoint2);
end


end
