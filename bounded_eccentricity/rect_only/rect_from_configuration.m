function rect = rect_from_configuration(config)
rectLength = 5;

% in body coordinates
rect = [-1 - .25i; 1 - .25i; 1 + .25i; -1 + .25i];
P = zeros(2, 4);
P(1, :) = transpose(rect);
P(2, :) = 1;

P = config * scaling(rectLength) * P;

rect = P(1,:);

end
