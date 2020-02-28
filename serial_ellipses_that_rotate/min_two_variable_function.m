function [min_k, min_j, F_min] = min_two_variable_function(f, x1, x2)
% is there a 'map' command or are we doing this wrong?
n = length(x1);
m = length(x2);

min_k = 1;
min_j = 1;
for j = 1:n
	for k = 1:m
		F = f(x1(k), x2(j));
		F_min = f(x1(min_k), x2(min_j));
		if F < F_min
		        min_k = k;
	       		min_j = j;	       
		end	
	end
end


end
