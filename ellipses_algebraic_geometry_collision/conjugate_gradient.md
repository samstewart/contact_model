Introduce problem

Introduce Solution
Move in $A$-orthogonal directions which improves convergence to $n$.

Q: how does this reduce the problem to a circle?
Q: are we iteratively building the transformation?
Q: why should the gram-schmidt matrix be lower triangular? 

Q: why in residual directions?
1. iterative linearly independent set we can convert to an $A$ orthogonal set
2. the definition of the residual means that the transformation mapping $r_i$ to $d_i$ ($A$ orthogonal directions) is itself an orthogonal transformation (preserves angles). 

Q: what does the Kyrlov subspace property get us?
The residual $r_{i + 1}$ is $A$ orthogonal to all the previous directions except $d_i$. I still don't see exactly why this gives it to us.

Q: how does Gram-Schmidt work in the case when we have non-euclidean dot product?

Technique:


