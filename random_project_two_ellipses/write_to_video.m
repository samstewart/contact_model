function write_to_video(fname, fun_anim)
v = VideoWriter(fname)
open(v)
set(gca, 'nextplot', 'replacechildren');

fun_anim()


end
