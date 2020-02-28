I'm trying something new: writing more formally and carefully the problems I am trying to solve. I've noticed that Vladimir does this when he's thinking out loud, so it's probably a good idea.

There are degrees of formalism, coding being at one extreme, and a picture at the other. Too little formalism and you might miss critical details, too much formalism and you can't see the big picture. The art of problem solving is moving through this continuum.

Given two ellipses with centers at $q_1, q_2$, I want to find the shortest distance $d$ between the two ellipses. It suffices to find the shortest 

Q: is the parametric equation for a circle holomorphic away from 0? 

To scale the real by $r_1$ and imaginary part by $r_2$, we write $f(z) = r_1 x + i r_2 y = r_1 (z + \conj(z))/2 + r_2 (z - \conj(z))/2 = (r_1 + r2)/2 z + (r_1 - r_2)/2 \conj{z}$. So an ellipse centered at $q$ can be written parametrically as
\[
g(\theta) = q + f(e^{i \theta})
\]
Then the distance between an ellipse and a point $w$ (not inside the ellipse) is
\[
\min_{\theta \in [0, 2\pi]} \abs{g(\theta) - w}
\]
\]
To make the calculus simpler, we make the value function differentiable by squaring it (this leaves the minimum $\theta_0$ unchanged -- is this the Moreau envelope?). Then the optimality condition is
\[
(g(\theta) - w) \cdot g'(\theta) = 0
\]
This means $\theta$ is the only angle so that $w - g(\theta)$ is normal to the ellipse at $g(\theta)$. To compute the distance, we sweep the normal $n(\theta)$ around the set until it is parallel to $w - g(\theta)$.

Q: do we need to use the euclidean distance or can we use the algebraic distance between the two ellipses?


A model problem is then to apply our local distance tracking technique to the simpler situation of a distance from a translating ellipse to a single point.

Todo: get templates in vim working to auto populate function names in matlab (actually autocomplete can do the job)

If we parameterize the boundary of the ellipses via angles $\theta_1$ and $\theta_2$ so that
\[
z_1(\theta_1) = (r_1 \cos(\theta_1), r_2 \sin(\theta_1)) = R 
z_2(\theta_2) = (r_2 \cos(\theta_2), r_2 \sin(\theta_2))
\]

Suppose $f$ has a minimum $m$ when $f$ is constrained to $U$. Then the minimum of $f$ constrained to closed $W \subset U$ should be 
 
