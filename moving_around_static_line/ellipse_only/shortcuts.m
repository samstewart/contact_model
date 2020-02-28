function shortcuts()

global R;
global T;
global RT;
global LFC;
global D;

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
assignin('base', 'DS',do_steps); 


end
