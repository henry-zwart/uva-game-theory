#import "@preview/cetz:0.3.4"

#let darkred = rgb(63%, 0, 0)
#let darkcyan = rgb(0, 55%, 55%)

#let nfg-matrix(actions: (("T", "B"), ("L", "R")), payoff) = {
  cetz.canvas({
    import cetz.draw: *

    scale(x: 60%, y: 60%)

    let rowcolor = darkred
    let columncolor = darkcyan

    let n_row_actions = actions.at(0).len()
    let n_col_actions = actions.at(1).len()
    let height = n_row_actions * 2
    let width = n_col_actions * 2
    set-style(stroke: black + 1.1pt)
    
    // Draw border
    line((0,0), (width, 0), (width, height), (0, height), (0,0))

    // Draw vertical/horizontal cell boundaries
    for x in range(1, n_col_actions) {
      line((x*2, 0), (x*2, height))
    }
    for y in range(1, n_row_actions) {
      line((0, y*2), (width, y*2))
    }

    // Draw diagonals
    set-style(stroke: black + 0.5pt)
    for x in range(0, n_col_actions) {
      for y in range(0, n_row_actions) {
        let start = (x*2, height - y*2)
        let end = ((x+1)*2, height - (y+1)*2)
        line(start, end)
      }
    }

    // Row labels
    for (i, action) in actions.at(0).enumerate() {
      let location = (0, height - 2*i - 1)
      content(
        location, anchor: "east", padding: .2, text(fill: rowcolor, action)  
      )
    } 

    // Column labels
    for (j, action) in actions.at(1).enumerate() {
      let location = (2*j + 1, height)
      content(
        location, anchor: "south", padding: .2, text(fill: columncolor, action)  
      )
    } 

    // Payoff
    for (i, row_payoffs) in payoff.enumerate() {
      for (j, cell_payoffs) in row_payoffs.enumerate() {
        let anchor = (j * 2, height - (i+1)*2) // Anchor at bottom left of cell

        // Row player (0.3, 0.3) offset
        let row_payoff_loc = (anchor.at(0) + 0.3 * 2, anchor.at(1) + 0.3 * 2)
        content(row_payoff_loc, text(fill: rowcolor, [#cell_payoffs.at(0)]))

        // Column player (0.7, 0.7) offset
        let col_payoff_loc = (anchor.at(0) + 0.7 * 2, anchor.at(1) + 0.7 * 2)
        content(col_payoff_loc, text(fill: columncolor, [#cell_payoffs.at(1)]))
      }
    }
  })
}

