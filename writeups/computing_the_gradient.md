
In the case of two guys, the boundary of the legal region is defined via the level set $\phi(x_1, y_1, x_2, y_2) = (x_1 - x_2)^2 + (x_2 - y_2)^2 - 4R^2 = 0$ or equivalently 
\[
	\phi(x_1, y_1, x_2, y_2) = \frac{(x_1 - x_2)^2}{4R^2} + \frac{(x_2 - y_2)^2}{4R^2} - 1 = 0$
\]
which is a convenient choice because now the gradient will have norm $1$. 

We can rewrite this constraint in terms of $d_1, d_2$ as
\[
	\phi = \frac{d_1^2 + d_2^2}{4R^2} - 1
\]

Something isn't right here...the point is we need to mod out by translations so that the constraint surface is compact. I'm not sure why he doesn't do it in the paper. Also, we can use symmetry: just mirror the actions of the first circle.

Actually, we can write the constraint in the coordinates $d = $ distance between two centers. Then the gradient is obvious. Really it should be $\RP^1$ embedded into $\R^2$ which is compact and one dimensional. Can we do the whole problem in these coordinates? Whenever we contact, we just move along gradient flow $\nabla_{d_1, d_2, d_n}$ when on the boundary

Goal: can we redo his numerics in these coordinates?

Outline:
Choose one of the circles in the collision as relative coordinates (modding out by translations).

So our velocity field

I should look at circle packing: I bet this is the parameterization they use.

Maybe some connection with hyperbolic space? Want to use l^infty norm but that is max, I want min to enforce my constraint. what if max 1/d_i < 1/R? I bet that ruins the triangle inequality, but maybe it's why we get a *reverse* triangle inequality?

Why are circle packings associated with hyperbolic space?

If everything is in distance coordinates, then our constraints becomes a box $d_i \geq 2R$ (always track all pairwise distences or define d_i to be the *closest* distance?) That will ruin the smoothness. So now our constraint manifold is embedded in $\R^{N(N-1)/2}$ (number of pairs of $N$ circles) 

How do we right the velocity in these coordinates?
The curvature?

Our gradient in these coordinates is $\partial_{d_1, d_2} \phi(d_1, d_2) = d_1/2R^2 + d_2/2R^2$. To get this in Euclidean coordinates, we use that the coordinate transformation $\Phi(, y) = (\sqrt{x_1 - x_2}, \sqrt{y_1 - y_2})$ and vectors transform linearly so 
\[
	\nabla_{d_1, d_2} \phi = \nabla_{x,y} \phi(x,y) \nabla_{d_1, d_2} \Phi(d_1, d_2) 
\]

	 
I was reading about level set methods. For a level set in $\phi(
