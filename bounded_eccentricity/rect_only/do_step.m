function configMoving = do_step(configMoving)

configStationary = translation(0);
desired_v = @(q) translation(.05 - .01 + .01i);

%desired_v = @(config) translation(velocity_pointing_at_point(config(1,2), -1 + 1i, .05))
%desired_v = @(c) translation(.05 * exp((5 * pi / 4) * i));
%desired_v = @(c) translation(-.05 * i);

% todo: if this was haskell, we could chain the function call
configMoving = desired_v(configMoving)*configMoving;
for i = 1:80
	configMoving = project_config(configMoving,  configStationary);

end
	if overlap(configMoving, configStationary) 
		overlap(configMoving, configStationary) 
	end
subplot(2,2, 1);

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
