#show title: set text(size: 17pt)
#show title: set align(center)
#import "@preview/diverential:0.3.0": *
#set page(paper: "us-letter", numbering: "1")
#set text(font: "Liberation Serif", size: 11pt)

// Document Title
#align(center)[
  #text(size: 24pt, weight: "bold")[An Intuitive Geometric Interpretation of the Lagrange Multiplier] \
  #v(1em)
  
  // Author info
  #text(size: 16pt)[
    Promitheas Nikou\
    #link("https://promitheas-nikou.me")[promitheas-nikou.me]
  ] \
  #v(0.5em)
  
  // Date
  July 17, 2026
]
#title[
  
]

= The problem

Our motivation in studying this specific problem is to have an easy solution for all problems of the following form:

1) we have a manifold M defined as the pre-image of a regular value of a function g, i.e. $M=g^(-1)(0)$, with $0$ being a regular value of $g:bb(R)^n->bb(R)^p$ (dimension of $M$ will be $d=n-p$),

REMINDER: A value $c$ is called a _regular value_ of a function $g$ if $g$ is an _immersion_ ($D g$ is surjective) at every point of $g^(-1)(c)={x in bb(R)^n|g(x)=c}$

2) we have a function $F:bb(R)^n -> bb(R)$ that is defined on the WHOLE ambient space $bb(R)^n$ and we now want to study the extrema of the function $f=F|M$, i.e. $F$ with its domain restricted on the manifold $M$, but

3) we unfortunately cannot directly find a closed formula for $D f$ because it is too difficult, convoluted, impossible to solve, or there simply exists no closed formula.

If we could find a closed formula for $D f$ the problem would be trivial: find a solution for $D f (x) = 0$ to locate all critical points and then use higher derivatives to determine what kind of extremum it is.

What can we do however without a formula for $D f$?

= The inspiration

We can start dealing with this problem one step at a time. We know we want $D f (x_0)$ to be exactly $0$, as in the null matrix, all zeroes, so it should be the case that $D f (x_0) v = 0$ for any vector v, obviously.

But what does 'any vector v' mean in this case? $F$ was defined on the ambient space of $bb(R)^n$ and for $F$, 'any vector v' would mean any vector v in its domain which is $bb(R)^n$. HOWEVER! The domain of $f$ is not $bb(R)^n$, it is the manifold $M$. Therefore we do not care equally about any vector in $bb(R)^n$, but instead only those that the derivative is meaningful to calculate along.

$D f (x_0) v$ essentially means 'the rate of change of the value of $f$ as we move along direction v'. In the context of $M$, we cannot move along any direction, we can only move along directions in its Tangential Space $T_x_0 M$!!!

Therefore to cleanly express this idea once more, we simply want to find a point $x_0$ where $D f (x_0) v = 0$ for every $v in T_x_0 M$!

= Building the solution

While our starting idea is totally correct, it does not directly provide us with an easy solution to our original problem, of not being able to compute it. Let's start by applying subtle transformations and substituting what we already know:

We know that since $f$ is of the form $f: bb(R)^n -> bb(R)$, $D f$ is a matrix of shape $1$ x $n$, i.e. a covector, a linear functional, a transposed vector.

So effectively $D f (x_0) v = 0 forall v in T_x_0 M$, is equivalent to $nabla f (x_0) bot v forall v in T_x_0 M$, and since it is perpendicular to every vector in the space, it is perpendicular to the whole space: $nabla f (x_0) bot T_x_0 M$.

This can be rewritten as $nabla f(x_0) in (T_x_0 M)^bot$ where $(T_x_0 M)^bot$ is the perpendicular space of the tangential space of $M$ at $x_0$, which is also known as the _normal_ space of $M$, sometimes symbolized as $N_x_0 M$.

We also know that $nabla g_i$ represent the directions along which the value of $g_i$ change, i.e. the directions along which we would tend to move away from the manifold, the normal space $N_x_0 M$.

The last key we need to remember is a property we learned in Linear Algebra last semester, that if $v in "span"{u_i}$ then there "$v$ can be written as a linear combination of the vectors $u_i$", or "there exists a vector $lambda$ such that $v = u lambda = sum u_i lambda_i$". If we write take $u_i = nabla g_i$, then $N_x_0 M = "span"{nabla g_i (x_0)}$, so $v in N_x_0 M <=> v in "span"{nabla g_i (x_0)} <=> exists lambda in bb(R)^p ,v = sum_(i=0)^p nabla g_i lambda_i = (D g (x_0))^T lambda$.

REMINDER: For any function $f: bb(R)^n -> bb(R)$, $nabla f = (D f)^T$

So our final rewritten version would be:
$ nabla F (x_0) = sum_(i=0)^n (nabla g_i (x_0))lambda_i $
#align(center,[
and by transposing both sides, we transform gradients to total derivatives, $nabla -> D$, we get:
])
$ (nabla F (x_0))^T = (sum_(i=0)^n (nabla g_i (x_0))lambda_i)^T $
$ D F (x_0) = sum_(i=0)^n lambda_i (nabla g_i (x_0))^T $
$ D F (x_0) = sum_(i=0)^n lambda_i (D g_i (x_0)) $
$ D F (x_0) = lambda^T D g (x_0) $


#align(center,[
*Which is exactly the result we were looking for!!!*
])

= Putting it all together

To reorganize everything we've seen so far:

1) We want to avoid dealing with $D f$, so we want to rewrite the constraint $D f (x_0) = 0$ using only $D F$.

2) At every _critical point_ of $f$, we need $F$ to have derivative of 0 along any direction that is tangential to our manifold, i.e. $D F (x_0) v = 0 forall v in T_x_0 M$.

3) That however just means that the total derivative is perpendicular to the tangential space, so it is part of the _normal_ space $D F (x_0) bot v forall v in T_x_0 M => D F (x_0) bot T_x_0 M => D F (x_0) in N_x_0 M$.

4) The normal space of $M$ at $x_0$ is simply all the directions along which $g$ tends to change, i.e. the span of $nabla g_i$ since $nabla g_i$ represents the direction of maximum change for each dimension $i$ of $g$.

5) By transforming $nabla g_i$ into $D g_i$ (transpose) we are now dealing with rowvectors instead of columnvectors, so we can now replace the gradients with derivatives and say $D F (x_0)$ is a linear combination of the rowvectors $D g_i (x_0)$.

6) We can write express that linear combination as "existence of a linear functional, a.k.a. transposed vector", $exists lambda in bb(R)^p$ such that $D f (x_0) = lambda^T D g (x_0)$. It is this particular value of $lambda$, that we can solve for algebraically, that is known as the "Lagrange Multiplier".

= Final notes

The constraint that $g(x_0)=0$ follows naturally from the fact that $x_0 in M = g^(-1)(0)$.

There is a risk of confusion in such problems due to the fact that we are dealing with both vectors (columns, $n$ x $1$) and covectors (rows, $1$ x $n$), and often we must use both or switch between them to produce the results we need.

It's important to keep in mind, if $f: bb(R)^n->bb(R)$, then:

- $nabla f (x_0)$ is a vector (column, $n$ x $1$)
- $D f (x_0)$ is a covector (row, $1$ x $n$)

And the other important difference is that $nabla f$ is only defined for scalar functions ($f: U -> bb(R)$) while the total derivative $D f$ is also defined for vector-valued functions $f: bb(R)^n -> bb(R)^k$ (and is in fact the $k$ x $n$ Jacobian matrix of f, $J(f)$).
