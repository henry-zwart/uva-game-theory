#import "@preview/cetz:0.3.4"
#import "@preview/fletcher:0.5.7" as fletcher: diagram, node, edge, shapes
#import "@preview/frame-it:1.1.2": *
#import "@local/uva-game-theory:0.1.0": games.nfgame 



// Define solution environments
#let exercise() = [= ]
#let part() = {[== ]}

#let (theorem, lemma, corollary, proposition) = frames(
  theorem: ("Theorem", ),
  lemma: ("Lemma", ),
  corollary: ("Corollary", ),
  proposition: ("Proposition", ),
)
#show: frame-style(styles.boxy)

// Mathematical shorthand
#let cart(x) = $bold(#x)$
#let vector(x) = $bold(#x)$

// Main content
#exercise()

This is a basic template you can use for your homework submissions for Game Theory. You are welcome to use something prettier of your own making, provided you keep margins and font size as they are in this document.

Make sure you use the correct brackets when typesetting _tuples_ such as $G = angle.l N,v angle.r$, to distinguish them from _vectors_ such as $vector(a) = (a_1,dots,a_n)$. Observe that a _Cartesian product_ #box[$cart(A) = A_1 times dots times A_n$] is a set of vectors of this type. Note the use of two different custom-made commands for $vector(a)$ and $cart(A)$ in the source text, both mapping to the same low-level Typst command. This kind of "semantic typesetting" leads to cleaner documents and, hopefully, fewer mistakes. 

You probably already know how to typeset _sets_ such as $S = { k in NN | k "is odd" }$, _functions_ such as $f : NN arrow RR$ with $f : x mapsto sqrt(x)$ for all $x in NN$ (note the two different arrows!), and _fractions_ such as $k/(k + ell)$. Note the use of $ell$ instead of $l$, due to the latter being somewhat difficult to distinguish from a 1. I often find it helpful to explicitly indicate when _multiplication_ is taking place, as in $p dot q$ (as opposed to $p q$). There are a number of different approaches to typesetting _equations_. This is one of them:
$
op("argmax", limits: #true)_(x in S) f(x) = {x in S | f(x) >= f(y) "for all" y in S}
$
Special symbols you might not have come across before include those we are going to use to typeset _preference relations_, as in $C succ C'$ and $C^* succ.eq C$. Wondering how to typeset one of the more exotic Typst symbols? Try #link("https://detypify.quarticcat.com/").

#exercise()
If an exercise has multiple parts, clearly indicate the start of each part in your answer. 

#part()
#lorem(60)

#part()
#lorem(100)

#exercise()
If your answers are very short, then an itemised list might work better.

+ #lorem(19)

+ #lorem(30)

+ #lorem(18)

#exercise()
Here are a few more examples for things you might need to typeset yourself:

#grid(
  columns: (1fr, 1fr, 1fr),
  align: center + bottom,
  nfgame([T], [B], [L], [R], (1, 2, 3, 4, 5, 6, 7, 8)),
  diagram({
    let (A, B) = ((0,0), (2,0))
    node(A, "A", stroke: 0.6pt, name: "0")
    node(B, "B", stroke: 0.6pt, name: "0")
    edge(A, B, 10, "->", stroke: 0.6pt, bend: +35deg)
    edge(A, B, $x$, "->", stroke: 0.6pt, bend: -35deg)
  })
)

Here's an example for a numbered theorem:

#theorem[_Nash, 1951_][
  Every finite normal-form game has a Nash equilibrium.
] <thm:nash>

To refer to this theorem, use a reference by label (as in @thm:nash) rather than to hard-code the number (which only leads to errors). Finally, here's an example for a table:

#figure(
  table(
    columns: 2,
    align: (left, left),
    [_Name_], [_Dates_],
    [John F. Nash], [1928--2015],
    [Julia Robinson], [1919--1985],
    [Lloyd Shapley], [1923--2016]
  )
)
