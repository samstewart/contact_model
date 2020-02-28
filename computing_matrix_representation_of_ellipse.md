One way to describe an ellipse is via its rotation $\theta$ and its center $q$. Another way to describe it is via a level set of a quadratic form $x^T A x = 0$ where $x$ is a point in homogenous coordinates (how does this relate to ellipses as circles in projective space?).

For example, the ellipse with axes of length $(1,2)$ where the short axis of length $1$ is aligned with the $x$ axis would have the equation $x^2 + (y/2)^2 - 1 = 0$ so the corresponding quadratic form is
\[
A = [
1 0 	  0
0 (1/2)^2 0
0 0       -1
]

\]

If $A = [1 0 0; 0 1 0; 0 0 -1]$, then we recover the equation for a circle $x^2 + y^2 - 1 = 0$. One way to think of an ellipse is then a projective transformation. For example, suppose we define a new coordinate system $x = By$ with
\[
B = [a 0 0; b 0 0; 0 0 1].
\]
Then our circle defined by $y^T A y = 0$ becomes $(B^{-1} x)^T A B^{-1} x = 0$ or $x^T B^{-1} A B^{-1} x = 0$. In these coordinates, our quadratic form becomes
\[
B^{-1} A B = [1/a^2 0 0; 0 1/b^2 0; 0 0 -1]
\]

Note: we represent Lie algebras into operator algebras (matrix groups) and not into vector spaces because we need something with a noncommutative product!

What is the dual operator of an affine transformation? What does the transpose mean? What is the relationship between quadratic forms and transformations? Should their values be invariant?  
 
One way to *define* an ellipse is as a projective transformation of a circle. The quadratic form 
\[
A = [-1 0 0; 0 -1 0; 0 0 1]
\]
defines a circle via $x^T A x = 0$. Changing coordinates to $y = Px$ (where $P$ is a composition of first a scaling, then a rotation, and then a translation) means the equation for the circle becomes $x^T P^{-T} A P^T x = 0$. This is now the equation for the ellipse.

Claim: The quadratic form $M$ that defines an ellipse is invertible. 
Pf: An ellipse is a projective transformation of a circle and is by definition invertible. 

The characteristic equation of the two ellipses is $f(\lambda) = det(\lambda A - B) = det(A^{-1}) det(\lambda I - AB)$. 

Q: what is the degree of the polynomial $f$? 
Q: can an affine transformation have a negative determinant?

Q: why do we look at the spectrum of the operator AB? 

Q: can we rephrase this in terms of mobius transforms?

Q: why are affine transformations in $\R^n$ projective transforms in $\RP^{n - 1}$? Translations <--> scaling

Q: interestingly, the transformations in the complex plane of scaling the axes differently is not holomorphic. Is there some connection the failure of commutivity with the matrices? I think that locally holomorphic functions are rotations + uniform scaling so they...something about invariance

Q: do rotations and scalings commute? Scaling both axes by the same amount: yes. Otherwise, I don't think so. Can check infinitismal rotations
[0 1; -1 0]

Q: does projective transformation depend on the coordinates we use for the projective space? What do "coordinates" in the projective space mean? What happens to the linear structure after the quotienting?
Q: what is the right direction to see that an ellipse is a projective transformation of a circle?

So in general
\[
A = [
a^2 0  0
0 b^2 0
