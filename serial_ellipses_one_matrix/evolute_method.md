Let's first try to understand the method for an ellipse and a line.

The projection onto a circle with radius $R$ and center $q$ from point $p$ is easy: just intersection the $pq$ with the circle. The formula is $q + R * (p - q)/\abs{p - q}$.

To project onto other shapes, we can locally approximate them with a tangent circle (at least $C^2$ surfaces). Then the projection onto the circle should be close to the projection onto the line. The projection onto the line is the point $q$ such that if $C_q$ is the circle tangent to the line at $q$ then $P_{C_q}(p) = q$. 

This fixed-point definition motivates an iterative scheme: minimize the distance between $P_{C_q}(p)$ and $q$. One computationally convenient measure of distance is the arclength along the circle $C_q$ from $P_{C_q}(p)$ to $q$, call this $s(q, p)$. The constraint is that $q$ lies on the shape (in this case a line) do parameterize $q$ as $q(t)$. Then we move $t$ according to $-ds(q, p)/dt$ like usual gradient descent.

Note: by accident we started doing this for an ellipse. The ingredients:
1. Minimize distance between $q$ and $P_{C_q}(p)$ by minimizing the arc length (just for computational convenience)

Here we know that by definition of signed arclength
\[
	-\frac{ds}{dt} = \sqrt{\abs{q'(t)}^2} = \sqrt{a^2 + b^2 - \abs{q}^2}
\]

By the definition of cross product
\[
	\abs{P_{C_q}(p) \times q} = \abs{q} \abs{P_{C_q}(p)} \sin(s(q, p) / R)
\]

Thus
\[
	\frac{dt}{ds} = \frac{1}{a^2 + b^2 - \abs{q}^2}
\]
Discretizing this gives
\[
	\Delta dt \approx \frac{\Delta s}{a^2 + b^2 - \abs{q}^2}
\]

In the case of two lines (both vertical) we again approximate both lines by circles because the the shortest line distance between two circles is again the intersection of the line connecting their centers with the two circles.

The algorithm is similar: we look for a fixed point $(q^1, q^2)$ such that $P_{C_q^1}(q^2) = q^1$ and $P_{C_q^2}(q^1) = q_2$. The same gradient descent idea applies so that we get
\[
	\Delta dt_1 \approx \frac{\Delta s_1}{a^2 + b^2 - \abs{q}^2}
	\Delta dt_2 \approx \frac{\Delta s_2}{a^2 + b^2 - \abs{q}^2}
\]
with $\Delta s_1$ the arclength between $P_{C_q^1}(q^2)$ and $q^1$ and $\Delta s_2$ the arclength between  

Q: So we are measuring arclength starting from $P_{C_q}(p)$?

Q: can we use the dot product instead of the cross product?
Q: why do we move in $dc/dt$ when we want to decrease the arc length? can arc length be negative? I think because moving along the evolute moves the tangent vector in the opposite direction so the sign flips?




An ellipse is locally approximated at point $x$ by a circle. 

(diagram of osculating circle)

The projection onto the circle $P_C(p)$ thus approximates the projection $P_E(p)$ onto the ellipse. 

 


We project $p$ onto the *circle*. If that point, call it $q$ is *the same* as $x$, then the projection onto the circle matches the projection onto the ellipse. This is natural because $x$ is a point both on the circle and on the ellipse.

So we are really looking for a fixed point condition: $P_C(p) = P_E(p)$.


The *center* of this circle is called the evolute and in the case of an ellipse has an explicit parametric formula. 

\[
C(t) = (a^2 - b^2) (\cos(t)^3/a, -\sin(t)^3/b)
\]
