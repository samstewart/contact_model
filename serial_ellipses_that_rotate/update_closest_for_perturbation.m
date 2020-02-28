function [closest_angles, closest_distances] = update_closest_for_perturbation(k, perturbation, cur_c, closest_angles)
[closest_angles, closest_distances] = update_closest(replace_row(cur_c, k, perturbation), closest_angles);
end
