#show title: set text(size: 17pt)
#show title: set align(center)
#import "@preview/diverential:0.3.0": *

#title[
  An Intuitive Interpretation of Laurent Series
]

= Laurent Series

Let $c_i$ be the Laurent Series of $f:CC->CC$ around $z_0$, if $f$ is _meromorphic_ (holomorphic except isolated points, here means holomorphic everywhere except possibly $z_0$) in a region around it.

That means that for every $z in CC \\ {z_0}$, $f(z) = sum_(n=-infinity)^(infinity)c_n (z-z_0)^n$.

For simplicity, I will be using $Delta z = z-z_0$ so $f(z) = sum_(n=-infinity)^(infinity)c_n Delta z^n$

We know that all holomorphic(/meromorphic) functions are analytical (can be expressed as an infinite power series) and that if they are defined at $z_0$ then the series is a _Taylor Series_ (only positive powers of $Delta z$), otherwise it will include some (possibly infinite) negative terms, and be a _Laurent Series_.

I will also be writing Laurent series in the following manner to better visualize certain operations:


#align(center)[#grid(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr), // 4 equal columns
  gutter: 10pt,                  // Space between items
  [...],
  [$c_(-3) Delta z^(-3)$],
  [$c_(-2) Delta z^(-2)$],
  [$c_(-1) Delta z^(-1)$],
  [$c_0$],
  [$c_1 Delta z^1$],
  [$c_2 Delta z^2$],
  [$c_3 Delta z^3$],
  [...]
)]

The point of this document is not to explain the theory, you can check the script for that; I will try instead to give an intuitive explanation for why seemingly random formulas like:

$ "Res"(f,z_0) = (phi ^ ((m-1))(z_0))/((m-1)!) $

actually produce useful results.

= Known formulas

Now let's start from scratch, let's forget what we know about the properties of Laurent Series and let's try to reinvent it:

=== 1. Multiplying by $Delta z$

The simplest thing we can do to a Series is multiply by $Delta z$, thereby shifting all the terms right.

#align(center)[#grid(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr), // 4 equal columns
  gutter: 10pt,                  // Space between items
  [...],
  [$c_(-3) Delta z^(-3)$],
  [$c_(-2) Delta z^(-2)$],
  [$c_(-1) Delta z^(-1)$],
  [$c_0$],
  [$c_1 Delta z^1$],
  [$c_2 Delta z^2$],
  [$c_3 Delta z^3$],
  [...]
)]

#align(center)[
$ Delta z↓ $
]

#align(center)[#grid(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr), // 4 equal columns
  gutter: 10pt,                  // Space between items
  [...],
  [$c_(-4) Delta z^(-3)$],
  [$c_(-3) Delta z^(-2)$],
  [$c_(-2) Delta z^(-1)$],
  [$c_(-1)$],
  [$c_0 Delta z^1$],
  [$c_1 Delta z^2$],
  [$c_2 Delta z^3$],
  [...]
)]

=== 2. Derivatives
We know $Delta z^n$ is holomorphic in $CC \\ z_0$, and that:

#list(
[For $n>0$, $dv(c_n Delta z^n,z) = n c_n Delta z^(n-1)$],
[For $n=0$, $dv(c_0,z) = 0$ (constant)],
[For $n<0$, $dv(c_n Delta z^n,z) = n c_n Delta z^(n-1)$]
)

If we apply these simple rules to a series, it will be transformed as follows:

#align(center)[#grid(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr), // 4 equal columns
  gutter: 10pt,                  // Space between items
  [...],
  [$c_(-3) Delta z^(-3)$],
  [$c_(-2) Delta z^(-2)$],
  [$c_(-1) Delta z^(-1)$],
  [$c_0$],
  [$c_1 Delta z$],
  [$c_2 Delta z^2$],
  [...]
)]
#align(center)[
$ d/(d z)↓ $
]

#align(center)[#grid(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr), // 4 equal columns
  gutter: 10pt,                  // Space between items
  [...],
  [$-2 c_(-2) Delta z^(-3)$],
  [$-c_(-1) Delta z^(-2)$],
  [$0 (Delta z^(-1))$],
  [$c_1$],
  [$2 c_2 Delta z$],
  [$3 c_3 Delta z^2$],
  [...]
)]
Intuitively, all the terms slide to the left, and are multiplied by their exponent, including the constant term, so it becomes 0!

=== 3. Nth derivatives

We can also generalize that same operation multiple times. Even though this is more complicated, it is still very important and has multiple critical applications. I won't draw a full diagram because the general formula is a little convoluted but basically to get an idea of what happens to a series in this way, let's consider specific terms and what happens to them:

($c_i$ is the old series, and $c'_i$ is the new one)

$c'_0 = n! c_n$

$c'_k = 0$ for all $k$ between $-n$ and $-1$

$c'_(-n-1) = (-1)^n n! c_(-1)$

Each time we apply $d/(d z)$ term $c_(-1)$ becomes $0$, and all the previous zeroes, slide once more to the left, $n$ times total.

All terms above $c_n$ and below $c_(-n)$ trivially shift down.

=== 4. Evaluating

One last trick we can do, that is trivial, but still should be mentioned, is if we have transformed a series, and want to extract a particular term from it (remember, we usually won't have all the terms laid out in a list so we'll have to work to get them), the easiest one to get is the term $c_0$, IF all of the negative terms have coefficients of 0, a.k.a. the Laurent Series is also a Taylor Series. In that case, to get $c_0$, we can simply evaluate our new function at $z_0$, the point around which it is expanded. That way all terms coefficients except $c_0$ are multiplied by $(z_0-z_0)^n=0^n=0$, so we are left with just $c_0$

= Applications

Now using these explanations for multiplication and differentiation, let's try to interpret some formulas we've seen before!

== Residue

We know the residue is the term $c_(-1)$. The reason for this is that when we integrate a Laurent Series around any close loop, the integrals of every element EXCEPT $c_(-1)$ have a result of 0.

Let's examine different cases for this:

==== a) Simple Pole

$f$ is said to have a simple pole at $z_0$ if the series around $z_0$ has non-zero $c_(-1)$ but all terms below that are 0.
In that case we can use our right-shift (multiply by $Delta z$) to move the term $c_(-1)$ into $c_0$ and then we can just pluck it out!

#align(center)[#grid(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr), // 4 equal columns
  gutter: 10pt,                  // Space between items
  [...],
  [$0$],
  [$0$],
  [$c_(-1) Delta z^(-1)$],
  [$c_0$],
  [$c_1 Delta z^1$],
  [$c_2 Delta z^2$],
  [$c_3 Delta z^3$],
  [...]
)]

#align(center)[
$ Delta z↓ $
]

#align(center)[#grid(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr), // 4 equal columns
  gutter: 10pt,                  // Space between items
  [...],
  [$0$],
  [$0$],
  [$0$],
  [$c_(-1)$],
  [$c_0 Delta z^1$],
  [$c_1 Delta z^2$],
  [$c_2 Delta z^3$],
  [...]
)]

That's amazing! The resulting function (the power series!!!), $f(z)(z-z_0)$ is also holomorphic at $z_0$, and in fact its constant term is $c_(-1)$, a.k.a. the residue we're looking for!

So $"Res"(f,z_0) = lim_(z->z_0)f(z)(z-z_0)$

WARNING: The reason we use $lim$ is because $f$ isn't actually defined at $z_0$ but because its meromoprhic in a region around $z_0$, taking the limit is the same as evaluating the Series at that point.

==== b) m-th Order Pole


$f$ is said to have a pole of order $m$ at $z_0$ if the series around $z_0$ has non-zero $c_(-m)$ but all terms below that are 0. Other negative terms could be zero!

In this case, because $m$ is a finite natural number, we can do a similar trick like before, except with more steps.

We want to move the term $c_(-1)$ to the slot 0, BUT, to be able to actually get the value (remember, we don't have the series laid out before us, only a function we are transforming), we have to make sure the function has no negative terms, otherwise we can't evaluate at $0$.

But we remember that when differentiating a series, we are deleting the term at 0, so what we could do, is shift all terms right by $m$, and then slide left and delete the first $m-1$ terms, deleting terms $c_(-m)$ through $c_(-2)$ and leaving $c_(-1)$ one slot to the right of its original position!!!

Let's try it! First multiply $m$ times:

#align(center)[#grid(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr), // 4 equal columns
  gutter: 10pt,                  // Space between items
  [...],
  [$0$],
  [$c_(-m) Delta z^(-m)$],
  [...],
  [$c_(-1) Delta z^(-1)$],
  [$c_0$],
  [$c_1 Delta z^1$],
  [$c_2 Delta z^2$],
  [...]
)]


#align(center)[
$ Delta z^m↓ $
]

#align(center)[#grid(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr), // 4 equal columns
  gutter: 10pt,                  // Space between items
  [...],
  [$0$],
  [$0$],
  [...],
  [$0$],
  [$c_(-m)$],
  [$c_(-m+1) Delta z^1$],
  [$c_(-m+2) Delta z^2$],
  [...]
)]

Which is really cool, since this is now a Taylor Series and by differentiating we can indeed delete the terms we need!


#align(center)[#grid(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr), // 4 equal columns
  gutter: 10pt,                  // Space between items
  [...],
  [$0$],
  [$c_(-m)$],
  [$c_(-m+1) Delta z^1$],
  [$c_(-m+2) Delta z^2$],
  [$c_(-m+3) Delta z^3$],
  [...]
)]

#align(center)[
$ d/(d z)↓ $
]

#align(center)[#grid(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr), // 4 equal columns
  gutter: 10pt,                  // Space between items
  [...],
  [$0$],
  [$c_(-m+1)$],
  [$2 c_(-m+2) Delta z^1$],
  [$3 c_(-m+3) Delta z^2$],
  [$4 c_(-m+4) Delta z^3$],
  [...]
)]


#align(center)[
$ d/(d z)↓ $
]

#align(center)[#grid(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr), // 4 equal columns
  gutter: 10pt,                  // Space between items
  [...],
  [$0$],
  [$2 c_(-m+2)$],
  [$6 c_(-m+2) Delta z^1$],
  [$12 c_(-m+3) Delta z^2$],
  [$20 c_(-m+4) Delta z^3$],
  [...]
)]

The additional coefficients that get added on top of our series are simply due to the differentiation formula
$ dv(Delta z^m, z) = m Delta z^(m-1) $
applied at each step again and again, but since we only care about the constant term, we can zoom in on that and realize, it is simply $times 1$ then $times 2$ then $times 3$ until $times m$, so total $(m-1)!$ (we will differentiate $m-1$ times), and the term will be our target, $c_(-1)$

So we see that:
$ ( f(z)Delta z^(m))^((m-1))/(m-1)! $

At this point you may notice that my form is slightly different from the standard one and the reason for that is I'm using an informality:

Typically, if you take the function $x->1/x$ and you multiply it with the function $x->x$, what you get is not $x->1$, but $x->1|x in RR\\{0}$, because even though it's value everywhere is $1$, the original function is not defined at $0$ so neither is the product.

The same issue applies to our function $f$: since $f(z_0)$ is not defined, $f(z_0) Delta z$ is also not defined, even if its corresponding power series is a Taylor Series. However!!! because holomorphic functions are analytical, we can say that 'we consider the unique holomorphic in our domain function $phi(z)$ which is guaranteed to exist and be unique due to power series, such that $phi(z)/(Delta z^m)=f(z)$, for every point in $f$'s domain'.

That is precisely what is happening in the Skript and is the reason we write (as we should) $ "Res"(f, z_0) = (phi^((m-1))(z))/((m-1)!) $

but *JUST FOR THE SAKE OF SIMPLICITY AND VISUALIZATION*, I have taken the liberty of treating $phi(z)$ as if it means $f(z) Delta z^m$. KEEP THAT IN MIND!

==== c) Essential Singularities (wesentlichen Singularitäten)

We have now one last case to examine, essential singularities, cases where there are infinite negative coefficients with non-zero values.

This is an issue for us, since no amount of sliding left and right will save us. That's why in these cases we can only hope that we have some other way to extract the term.

Thankfully, in 99% of cases you will encounter, there will be such a way.

Usually the essential singularities you will encounter do not occur naturally, and are produced specifically _because_ we fed a negative power to an infinite power series.

An example for this is the essential singularity of
$ f(z) = e^(1/z) $
which is often used as an example in exercises.

This (and most examples you will encounter in general) has an essential singularity (at $z_0=0$) because $exp()$ is itself defined as an infinite power series, and we are feeding it a negative power of $z$.

This is not an issue for us though, because the power series of $e^z=exp(z)$ is known to us and is
$ e^z=exp(z)=sum_(n=0)^infinity z^n/n! $

This immediately solves our problem, because this means that this is one of the few cases where we have all the terms in our power series, a.k.a. we know all the $c_i$ terms to begin with!

So to get the residue of this $f$ for example, we can simply check the coefficient of $z^(-1)$ which is the second term of the our sum and is in fact $1/1! =1$.

One thing to keep in mind, is that the exercise may transform this power series to make it a little harder for you, but this should be no cause for concern since you can easily track the transformations and still get the new clean power series...
