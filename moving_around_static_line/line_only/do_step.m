function configMoving = do_step()

%desired_v = @(config) translation(velocity_pointing_at_point(config(1,2), -1 + 1i, .05))
%desired_v = @(c) translation(.05 * exp((5 * pi / 4) * i));
%desired_v = @(c) translation(-.05 * i);
%desired_v = @(c) translation(.05);
%configStationary = rotation(pi/2);

configMoving = project_config(desired_v(configMoving) * configMoving, configStationary);
cla;
axis square;
axis([-20 20 -20 20])
hold on;

    draw_state(configStationary);	
    draw_vel(configMoving, desired_v(configMoving));
    draw_state(configMoving);	

  hold off;
 drawnow; 

    % why is the affine group a semidirect product? What is the group structure? It's a good example of a semidirect product (as are the dihedral groups). 
    % (R_1, T_1) \cdot (R_2, T_2) x = R_1 (R_2 x + T_2) + T_1 = R_1 * R_2x + R_1 T_2 + T_1


end
