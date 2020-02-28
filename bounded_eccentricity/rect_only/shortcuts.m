function shortcuts()

global R;
global T;
global RT;
global LFC;
global D;
global configMoving;
global desired_v;
global configStationary;

desired_v = @(c) translation(.05);
configStationary = rotation(pi/2);
configMoving = translation(-10.1) * rotation(pi/10);

R = @rotation;
T = @translation;
RT = @rot_trans;
LFC = @line_from_configuration;
D = @draw_state;
DS = @do_steps;

assignin('base', 'R', R);
assignin('base', 'T', T);
assignin('base', 'RT', RT);
assignin('base', 'LFC', LFC);
assignin('base', 'D',D); 
assignin('base', 'DS',DS); 
assignin('base', 'desired_v', desired_v); 
assignin('base', 'configMoving', configMoving); 
assignin('base', 'configStationary', configStationary); 


end
