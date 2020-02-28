Over the last week and a half, I've managed to write a crowd simulator in Matlab based on the discrete contact model paper. 

Here are a few demos. First, let's look at the agents in a circle. Each agent wants to get to the point on the opposite side of the circle 

circle_crossing_example(6, 5)

Now let's look at two agents approaching each other. There is some kind of conservation of momentum going on: the velocity halves after the collision. Why is this happening? In general, the way they slide around each other is surprisingly realistic.

inelastic_collision_example()

Now let's look at agents crashing into a wall. They are all aiming for the point (0, -10).

agents_crashing_into_wall_example(15)

Let's look at agents exiting through a doorway

How to handle line segment obstacles?
Would it be interesting to investigate well posedness of the differential inclusion problem?
Current statement from paper:

Q: is a prox regular set a $C^2$ manifold? Is this constraint set a manifold?

The constraint set $Q$ has 
Q: what is the relationship between $C_q$ and $T_q Q$?

The constraint set $Q$A

Claim: Let $U$ be a subspace of $\R^n$. Then $P_U$ is linear
Pf:
You can write down a formula for the projection.

Claim: $P_U$ is a linear projection if and only if $U$ is a subspace of $\R^n$

Claim: There exists a change of basis so that every $P_U$ looks like
[I 0; 
 0 0]

Claim: two spheres under this scheme colliding with velocities v_1, v_2 leave with velocities (v_1 + v_2)/2. Can this be generalized?

A good example for the velocity is to consider two guys in a corridor: q_1, q_2 and work out the constraints on the velocity.

todo: plot "pressure" which corresponds to the lagrange multipliers (roughly)

Q: is every convex set a manifold? No, see stackoverflow discussion. At best a manifold with corners. Is a triangle a C^1 manifold? I don't think so. This shows some weakness in my definition of manifold.

A geometric way to state our ODE is
\[
	q(0) = q_0
	\frac{dq}{dt} = P_{C_q}(U(q))
\]
That is, we project the desired velocity onto the set of legal velocities at each step. The standard ODE theorem doesn't work because $C_q$ depends discontinuously on $q$ so the right handside is discontinuous (for example, the collision of two balls divides the velocity in half).

Q: are inellastic collisions a first order model?

C^1 < Lip < Abs Cont < Bound V < Diff A.E.

Let $U(q)$ be the desired velocity and $N_q$ be half of the orthogonal complement 
\[
	q(0) = q_0
	\frac{dq}{dt} \elem U(q) - N_q
\]
Define
\[
	C_q = \{ v \in \R^{2n} | D_ij(q) = 0 => G_ij(q) . v >= 0 \}
\]
the the polar cone
\[
	N_q = \{ w \in \R^{2n} | <w, v> <= 0 for all v in C_q \}
\]

Q: how should we handle who moves? How can we control that? Say if we wanted them each to move 1/2 the distance.
