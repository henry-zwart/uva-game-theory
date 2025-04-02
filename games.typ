#import "@preview/cetz:0.3.4"

#let darkred = rgb(63%, 0, 0)
#let darkcyan = rgb(0, 55%, 55%)

#let nfgame(r1, r2, c1, c2, payoff) = {
  cetz.canvas({
    import cetz.draw: *

    scale(x: 60%, y: 60%)
    
    let rowcolor = darkred
    let columncolor = darkcyan

    // let topleft = (-2, 2)
    // let topright = (2, 2)
    // let botleft = (-2, -2)
    // let botright = (2, -2)    
    
    // Row/column labels
    set-style(stroke: rowcolor)
    content(
      (-2,1),
      anchor: "east",
      padding: .2,
      text(fill: rowcolor, r1)
    )
    content(
      (-2,-1), 
      anchor: "east",
      padding: .2,
      text(fill: rowcolor, r2)
    )
    content(
      (-1, 2),
      anchor: "south",
      padding: .2,
      text(fill: columncolor, c1)
    )
    content(
      (1, 2),
      anchor: "south",
      padding: .2,
      text(fill: columncolor, c2)
    )

    // Payoff
    set-style(fill: rowcolor)
    for (i,y) in (0.6, -1.4).enumerate() {
      for (j,x) in (-1.4, 0.6).enumerate() {
        let idx = i * 2 + j
        content((x,y), text(fill: rowcolor, [#payoff.at(idx)]))
      }
    }
    
    // set-style(fill: columncolor)
    for (i,y) in (1.4, -0.6).enumerate() {
      for (j,x) in (-0.6, 1.4).enumerate() {
        let idx = 4+ i * 2 + j
        content((x,y), text(fill: columncolor, [#payoff.at(idx)]))
      }
    }

    // Border
    // bottom -> center horiz -> top -> left -> center vert -> right
    set-style(stroke: black + 1.1pt)
    line((-2,-2), (2,-2))
    line((-2,0), (2,0))
    line((-2, 2), (2,2))
    line((-2, -2), (-2, 2))
    line((0, -2), (0,2))
    line((2, -2), (2,2))

    // Diagonals
    // top-left -> bottom-right -> bottom-left -> top-right
    set-style(stroke: black + 0.5pt)
    line((-2, 2), (0,0))
    line((0,0), (2,-2))
    line((-2,0), (0,-2))
    line((0,2), (2,0))
  })
}
