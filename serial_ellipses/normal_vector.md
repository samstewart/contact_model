Consider two ellipses. The key part of the paper is choosing a $C^2$ constraint function $F(g_1, g_2)$ (where $g_1, g_2$ are the configuration of the ellipses) so that the gradient has positively independent columns. 

The constraint function will be based on the distance between the two ellipses, so we know immediately that its gradient will be skew symmetric (proof?). 

What is the right distance function? Or, what is the right normal vector for two ellipses in contact? By definition, moving the two ellipses in the direction of the gradient should maximize the distance.

If we only allow translations, is it obvious?

I'm reading about the support function, I wonder if this is what we need? Since our sets our convex, maybe it's enough.

There is the discrete algorithm we had using supporting hyperplanes for collision detection on polygons. Is there a continuous analog of that?

Is there a nice proof of the hyperplane separation theorem using support functions? Can we detect when two sets overlap using the support function?

What if we take as the distance function 

How can I turn the algebraic distance into a signed distance function?

Signed distance function to an ellipse:

f(x) = d(x, \partial \Omega) if $x \in \Omega$ or $-d(x, \partial Omega)$ if $x \notin \Omega$. 

Then the distance to another ellipse $A$ should be

\sup_{y \in A} f(y)

If $y \in |Omega$ 

Can I write the code to compute the distance function to an ellipse?

[1]. The distance function from a real algebraic variety (Ottaviani)

PhD school requires you wear all the hats. One hat I forget to wear is that of manager and the result is that I get stuck in the details without a broader plan. This contributes to the general feeling of not producing anything / not knowing which direction to go.

Goals for today:
plan my next goals / weekly schedule (10-11:45)
start writing summary of paper [done]
start reading for support vector machine [done]
start reading for conjugate gradient [done]

goals for today:
finish questions for vladimir
render demo of weird optimization artifact
write article describing how nonsmooth analysis produces KKT conditions for linear and semidefinite

Goals for today:
finish questions for vladimir, ask him to meet
read for support vector machine, try to write one in python to classify first 2D points and then handwritten letters. start article. 
make video demonstrating incremental technique problem
read about optimal control on Lie groups / convex optimization on Lie groups for proper framing
Try to write down formulation of our problem
Try model problem of line and point

Goals for this week:
meet with vladimir and get advice on direction of research / mathematical details / this summer
write code to compute gradient between ellipse and point (start with circle and point)
write up my current summary of the paper / precise questions for vladimir (with relevant videos)
Understand why gradient in euclidean coordinates is normal to level sets. how does this generalize to level sets of functions on manifolds? Morse theory?
Apply to code thing in New York
Decide what I'm going to do this summer

Goals for this month:
Write two high quality blog posts on any technical topic
put out feelers for summer work (Adrian and Trevor)
Find normal vector / gradient to distance function
Implement support vector machines / random forest in Python / write post
Tidy up github profile 
Implement SVD / PCA / write post 
Is the linear independence result essentially a topological result if we look at graph theory / hodge theory like the group at university of pennelyvania? Will this make it easier to extend to ellipses?

Goals for this semester:
Prove existence and uniqueness of solutions for ellipses
Write numerical scheme using convex approximation of configuration space
Implement basic machine learning algorithms / write about them
Have written six high quality blog potsts

Goals for this summer:
Finish ellipse paper and publish it
Desired results: proof of existence and basic numerical scheme

Goals for this year:
Have written two high quality blog posts per month
Everything should be project based with deliverables I can show off
Seriously learn stats (bayesian and otherwise)
Seriously learn graph theory
Seriously learn convex anlaysis / optimization / splitting algorithms
Seriously learn computational geometry
Seriously learn numerical analysis
Read and do some exercises from street fighting mathematics
Learn basic information theory
Seriously learn C++
What do I need to do robotics?
Start contributing to an open source project
Learn Tensorflow / Hadoop / etc
Implement basic CSLR algorithms

One of the main problems I see is that I've become insanely isolated. Is this necessary for doing the PhD? I don't think so. How can I get more plugged into the system? 

What I want out of the PhD:
How to most effectively learn from mistakes / seeing mistakes not as mistakes but instead as information probes into a hard problem
Ability to perceive and manipulate systems
Ability to be emotionally and intellectually flexible
Not be intimidated by jargon, titles, seniority
Ability to deep dive on accepted ideas / methodology
Be productively cynical
Ability to focus on *relevant* problems / compromises / be opportunistic in problem solving
Ability to learn abstract theory to clarify ad hoc results / theory
Ability to make conjectures / test them / refine them
Ability to organize definitions and theorems for clarity
Ability to make model problems of hard problems
Theoretical research is depressing / very monastic / very isolating
Learn how to write well
Working with real data / real systems / real world problems
Working on more applied problems
To get a job building stuff / managing people / solving problems
To learn how to do very independent work / manage myself / deal with ambiguity
To learn how to read / communicate complicated technical information
To appreciate broad samplings of modern math
To develop a taste for mathematical problems / scientific problems
To avoid writing low level engineering code
To avoid writing much code / sitting in front a computer
Learn how to estimate time / difficulty
Ability to manage long term uncertain project / adapt on the fly
The ability to quickly deduce the key idea / new trick from piles of formalism / hype. The ability to cut through bullshit
Ability to think independently / question assumptions
Know what is *hard* / what is repeating previous techniques / importing existing ideas. What is truly "novel"

What I don't want from the PhD:
To teach
To work on pure math problems. it seems like the biggest gain to be made is applying fairly basic techniques to more applied problems.
To go into academia
To get respect from other academics

We know that $d(\Omega, y)
