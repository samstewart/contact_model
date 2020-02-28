function I = inertia_tensor(configs, w, h)
mass = 1;
I = mass / 12 * (w^2 + h^2);
end
