
Amenable functions describe problems that are convex up to a change of coordinates.

We call a function $f$ amenable at a point $x$ if in an open neighborhood $U$ of $x$ it can be written $f = g \circ F$ where $g : \R^m \to \R^n$ is proper, lsc, and convex and $F : U \to \R^m$ satisfies a constraint 

Mangasarian-Fromovitz constraint qualification 
For inequality constraints $F_i(x) \leq 0$, there exists $\lambda$ such that $\nabla F(x)^T \lambda < 0$. 

should be a separating theorem?

Suppose you have a cone $A$, then the normal cone to $A$ is $N = \{ w \mid w \cdot v \leq 0, \textrm{ for all } v \in A \}$

The normal cone to $\R^n_+$ is $\R^n_-$. Pf: $x \geq 0$ and $y < 0$ means $x \cdot y \leq 0$. 

One constraint then $\nabla F_i(x) \lambda < 0$ means that $\nabla F_i$ all lie in the negative cone if we think of $\lambda$ as a separating hyperplane. The negative cone is the normal cone to the constraint set $D$. 

In the definition of amenable $D = \R^n_+$ and $g = \delta_D$, let's how the condition on $F$ is equivalent to the MFCQ criterion. The normal cone $N_D$ is $\R^n_-$ and by definition $ 

  

Q: are we asking that it doesn't squish the normal cone? 
Q: what is the Fenchel conjugate of affine function $f(x) = a^T x + b$? I'm wondering if $\nabla F(x)^T y \neq 0$ is a constraint on $F^*(x)$.

Fenchel conjugate: on $F : \R^n \to \R$
\[
F^*(x) = \sup_y x^T y - F(y)
\]

Then if $F(y) = Ay$ we have
\[
F^*(x) = \sup_y x^T y - Ay = 
\]

$g = \delta_D$ where $D$ is $y \geq 0$. 

Remember these are all local definitions at a point $x$!

How does 'there does not exist $y \in N_D(F(x))$ such that $\nabla F(x)^T y = 0$ imply this constraint qualification?


$f$ is strongly amenable if $F$ is $C^2$. In this case, we can prove that $f$ is prox regular.


Proof

We know that a closed set $C$ is prox regular if and only if $\delta_C$ is prox regular so if a set $C$ is described by a $C^2$ constraint function $F:\R^m \to \R^n$ into a convex set $D$ such that $F$ 

Q: why is it often easier to study the functions on an object instead of the object itself? This is a category theory thing... 
Q: can I rephrase the amenable function constraint as a cone constraint?
