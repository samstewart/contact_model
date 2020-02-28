The problem is simple: you have a list of points separated into two sets by a line. The goal is to choose the line that "best" separates the points. 

What do we mean by best? The line should be in 

How do we compute the distance of a training point $x_i$ to the line? We know by definition that if $\abs{f} = 1$ then $f(x_i - b)$ is exactly this *signed* distance. To fix the sign to be always nonnegatie, we can multiply by $y_i$, then $y_i * f(x_i - b)$ is the unsigned distance to the line from $x_i$.

G(f) = \min_i y_i f(x_i)


Q: is it the same as taking all pairwise differences between the two classes and halving it?
Q: is there an easy way to compute the dual of optimization problems via the Fenchel transform? Yes, I'll write that up today, both for the quadratic case and for the linear case
