function two_teams_example(n_per_team, box)
% n_per_team: number of guys per team
% box: [xmin xmax ymin ymax]
xmin = box(1);
xmax = box(2);
ymin = box(3);
ymax = box(4);

% generate positions in both halves of the box
q1 = ((xmax - xmin) / 2 * rand(n_per_team, 1) + xmin) + ((ymax - ymin) * rand(n_per_team, 1) + ymin) * i;

q2 = ((xmax - xmin) / 2 * rand(n_per_team, 1)) + ((ymax - ymin) * rand(n_per_team, 1) + ymin) * i;

speeds1 = .1 + .09 * rand(n_per_team, 1);
speeds2 = .1 + .09 * rand(n_per_team, 1);

fun_simulation([q1; q2], @(q) [speeds1; -speeds2], 1/2)
end
