function result = nest_function(f, x_0, n)
	if n == 0
		result = f(x_0);
	else
		result = f(nest_function(f, x_0, n - 1));
	end
end
