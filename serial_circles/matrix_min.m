function [min_score, min_i, min_j] = matrix_min(A)
min_score = Inf;
min_i = Inf;
min_j = Inf;
for i = shuffle(1:size(A, 1))
       for j = shuffle(1:size(A, 2))
	      if A(i, j) < min_score
		     min_score = A(i, j); 
		     min_i = i;
		     min_j = j;
	     end
       end	       
end
end
