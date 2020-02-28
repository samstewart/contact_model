function perturbation = perturbation_of_transformation(T, dR, dT)
perturbation = T;

perturbation(1,1) = exp(dR * i) * perturbation(1,1);
perturbation(1,2) = dT + perturbation(1,2);

end
