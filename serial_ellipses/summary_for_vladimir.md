Model problem: a line that can be translated and rotated

Q: Is finding the normal / gradient equivalent to differentiating a function on a Lie group? Is this the right framework?

Q: how to frame results of control theory on lie groups?
Q: is it better to put problem into a projective space to get rid of mirror symmetry?
Q: can a projective transformation reduce our problem to the circle problem? How do projective transformations distort distances?
Q: in the circle case, what is g and what is F?

Q: is the reason there is an easy gradient because the distance functions for circles is convex?
Q: is positive linear independence of gradients the same as the normal cone nonvanishing? Is prox regularity the same as the normal cone nonvanishing?

Q: can we generalize the separating axis theorem from polygons to convex shapes?
Q: is the reverse triangle inequality stronger or weaker than positive linear independence? Can we remove the triangle inequality?

Q: what is the geoemtric condition in terms of cones for positive linear independence versus linear independence?

proving that $\delta_Q$, the indicator function on $Q$ 

(if he wants a formal definition)


 
You can't get new results just by pattern matching, you have to dig into the messy details so that you can understand what is hard and what isn't. Hard means it requires a non-obvious / opportunistic argument. Something "creative".

Q: why do nonconvex sets need weak / strong definitions of closure?
Q: prove that a convex set is closed if and only if it is weakly closed (geometry of locally convex spaces). 
Q: why does convexity interact with the topology when it is an algebraic condition?

Q: why does a closed convex set of a unique / Lipschitz projection globally defined?

Q: what is the relationship between the set of allowed positions and the set of allowed velocities? Is there a condition directly on the velocities / tangent cone or do we need to reference the set explicitly? Does the definition of prox regularity require both the set and its normal cone? 
 
Q: absolutely continuous versus lipschitz cont? lipschitz functions are abs cont functions with a bounded derivative (almost everywhere?)

Q: why does he prove the statement in $W^{1,1}$ and then claim that they are absolutely continuous functions? 

Consider the case of two guys in a line (draw the picture). This set is not convex because the projection is not single valued globally outside the set. What do we mean by projection? The projection onto an arbitrary closed set $S \subset $\R^n$ is a set-valued operator defined by
\[
	P_S(y) = \{ z \in S \mid d_S(y) = \norm{y - z}
\]
where $d_S$ is the usual distance function to $S$. In our example, you can see that points on the line $y = x$ project to two different points. However, the projection *is* defined close to the boundary. This is prox regularity.

An example of a set that is not prox-regular is the epigraph of $-\abs{x}$.

Q: why do we need the normal cone to define prox-regularity? Why can't we define it just in terms of the projection?

The existence of a projection is equivalent to being able to roll a tangent ball of uniform radius around the entire exterior of the set. 
 
Expanding the inequality $\norm{(x + \eta v / \abs{v}) - y}^2 \geq \eta^2$ gives the condition that for all $y \in S, x \in partial S, v \in N(S, x)$ we have
\[
v \cdot (y - x) \leq \frac{\abs{v}}{2 \eta} \norm{y- x}^2
\]

By definition this inequality holds for each $Q_{ij}$ and $v = v_1 + \cdots v_n$ and because we can add inequalities together we only need to prove that
\[
\abs{v_1} + \cdots + \abs{v_n} \leq C \abs{v_1 + \cdots + v_n} = C \abs{v},
\]
a reverse triangle inequality.

It then follows that
\[
	v \cdot (y - x) \leq (\frac{\abs{v_1}}{2 \eta} + \cdots + \frac{\abs{v_n}}{2 \eta}) \norm{y - x}^2\leq \frac{C \abs{v}}{2 \eta}\abs{y - x}^2
\] 

(this above part messing with inequalities is too technical. there should be an easier condition to describe)
Mangasarian-Fromovitz conditions <---> reverse triangle inequality

Note: all their crap is proved via the example on 1811 in 'local differentiability of distance functions'

Q: why are the rows of the jacobian the gradients of the coordinate functions? why not the columns? Must be something about duality?

All we need to prove is that the gradient vectors of the active constraint are positively linearly independent. 

Q: I don't see exactly how the example reduces to the Mangarsarian-Fromovitz constraint.

The operator $B^T$ is not invertable, but we want to satisfy the MFCQ constraint by making sure that


Claim: 

Q: what is the normal cone to a single point?

Note: The lagrange multiplies is exactly the distance we need to move them apart? So when they prove a constraint on $\alpha_{ij}$, they are really just doing the obvious idea of changing coordinates to a box.


How does he convert this into a constraint on the KKT multipliers? Why does this produce nonuniqueness?
In the newer paper, he tries to prove the following result:
Let $B$ be the matrix where the column vectors are the normals. Then the proximal normal cone 

Q: why do we want the Moreau envelope?
Q: is enough to to prove an inverse triangle inequality for every two vectors? Yes, I think by induction.

Q: what are the requirements on the constraint functions in the local differentiability of distance function?
Q: Is it easier to prove the result with the hypermonotone condition?
Q: is there a geometric way to describe this in terms of the balls? Or the regularity of distance function? We are looking for a widget that deals nicely with the additive structure of the normal cones!
In general, if $v \in A = \cap A_i$ with $A_i$ prox regular.  

Q: why isn't it enough to just take the min of the $\eta$ for each set?
Q: what are the maps between convex sets? or prox regular sets? 
Q: what is the condition on the change of coordinates required to keep prox regularity? What is the constraint on the change of coordinates for the constraint functions? The constraint functions are kind of like the charts for a manifold but without the compatability condition. This set is a sheaf, can algebraic geometry tell us anything about the shape of the set? Does algebraic geometry have a definition for prox regularity?

I don't like the inequality version, I want something graphical.

Q: why do we want the preimage of $B^T \lambda = F$ to be uniformly bounded? We know $B^T$ is not invertable, but we don't want vectors pointing opposite of each other which would give unbounded $\lambda$. Can we phrase this in terms of 


Q: is this equivalent to the angle between two vectors being uniformly bounded away from $pi$?

We are looking at convex combinations of vectors $G_ij$

claim:  
\[

\]
Ex: 14 people and 29 contacts. Dimension of our space is 28 so means vectors in normal cone not linearly independent. Is it also means that $\lambda$ is not unique so there are multiple ways to resolve the collisions. How does the numerics find the solution? Why doesn't that contradict the reverse triangle inequality?

Q: linear dependence of 
Q: linear dependence <---> nontrivial kernel? yes by definition. means that in the right coordinates (aligning some of the axes with the kernel) this looks like a projection.

$G_ij$ as rows (so $B^T$)$ is not invertible
Q: if we know that $v_k, v_i$ are linearly independent, does that mean the whole set is independent?

In our example, we know this holds individually for $Q_{ij}$; does it hold for their intersection? In general the problem is at the 'corners' formed by the intersection (show picture of two circles -- do we have anything better?). We need to bound the angle between 

The main contribution of the paper [1] is to study the 

Q: how is $B$ like the pressure operator?
Q: why is it enough to focus on the contacts on the boundary of the cluster?

Q: is linear independence and the reverse triangle inequality equivalent? Do we know the constraint matrix is invertible? Which direction should constraint matrix go? Constraints are rows or columns? Can I reframe everything in terms of gigantic matrices? So should it be linear independence of active constraints? What does the reverse triangle inequality mean graphically (I think that the cone has angle less than $pi$?)




