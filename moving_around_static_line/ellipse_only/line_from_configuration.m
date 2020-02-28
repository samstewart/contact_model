function line = line_from_configuration(config)
lineLength = 5;

% in body coordinates
P = [-1 1; 1 1];

P = config * scaling(lineLength) * P;

line = P(1,:);

end
