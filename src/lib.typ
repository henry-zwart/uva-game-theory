#import "games.typ" as games

#let assignment(
  title: "Paper title",
  authors: (),
  course: none,
  collaboration: none,
  paper-size: "a4",
  school_logo: "resources/uva_logo_nl.svg",
  font: "Georgia",
  fontsize: 11pt,
  bibliography: none,
  bib_style: "american-psychological-association",
  bib_fontsize: 9pt,
  body,
) = {
  set document(author: authors.map(elem => elem.name), title: title)

  let format-author(author) = [#author.name (#author.id)]

  // Page setup
  set page(
    paper: paper-size,
    numbering: "1",
    margin: (x: 3cm, y: 3cm),
    header: context {
      if counter(page).get().first() > 1 {
        let header_img = box(image(school_logo, width: 60%))
        let header_title = {
            text(
            size: 11pt, 
            weight: 100, 
            font: "Libertinus Serif", 
            {
              if authors.len() > 1 {
                title
              } else {
                format-author(authors.at(0))
              }
            }
          )
        }
        grid(
          columns: (auto, 1fr, auto),
          align: (left, center, right + top),
          header_img, h(1fr), header_title
        )
      }
    }
  )

  // Body text
  set par(first-line-indent: 1em, justify: true, spacing: 0.7em)
  set text(font: font, size: fontsize)
  set quote(block: true)
  show quote: set block(above: 1.5em, below: 1.5em)

  // Figures
  show figure.where(kind: image): it => {
    set text(size: 9pt)
    it
  }

  // Numbering
  set heading(numbering: "1.A")
  set math.equation(numbering: "(1)")
  set enum(numbering: "(a)")

  // Tables: show hline above+below header, and below last row
  set table(
    stroke: (_, y) => (
          left: { 0pt },
          right: { 0pt },
          top: if y < 1 { stroke(0.7pt) } else if y == 1 { none } else { 0pt },
          bottom: if y < 1 { stroke(.5pt) } else { stroke(0.7pt) },
      ),
  )
  
  show std.bibliography: set text(bib_fontsize)
  set std.bibliography(title: text(10pt)[References], style: bib_style)
  
  align(center, {
    text(16pt, weight: "bold", [#course.name: #title])
    linebreak()
    
    v(1pt)

    let authors_section = {
      if authors.len() == 1 {
        format-author(authors.at(0))
      } else {
        let except_last = {
          authors
          .slice(0, authors.len() - 1)
          .map(format-author)
          .join(", ")
        }
        let last = format-author(authors.at(authors.len() - 1))
        [#except_last and #last]
      }
    }
    
    text(11pt, authors_section)
    line(length: 100%)
  })

  if collaboration != none {
    [#text(weight: "semibold", [Collaboration]) #{emph(collaboration)}]
  }

  body

  bibliography
}

// exercise & part headings
#let ex_counter = counter("exercise")
#let part_counter = counter("part")
#let exercise(points: none) = {
  // Update exercise counter, reset part counter
  ex_counter.step()
  part_counter.update(0)
  // Add spacing around heading
  v(1em)
  //Create heading text
  block(
    {
      // Style text
      set text(size:16pt, weight:"bold")
      set par(first-line-indent: 0em)
      "Exercise " + context ex_counter.display()
      if points != none {
        text(weight: "regular", style: "oblique")[ (#points points)] 
      }
    }
  )
}

#let part(points: none) = {
  // Update Counters
  part_counter.step()
  // Add spacing around heading
  v(1em)
  //Create heading text
  block(
    {
      // Style text
      set text(size:14pt, weight:"bold")
      set par(first-line-indent: 0em)
      "Part " + context part_counter.display("(a)")
      if points != none {
        text(weight: "regular", style: "oblique")[ (#points points)] 
      }
    }
  )
}

// Display solution in a frame with background colour
#let solution(it) = {
  set block(fill: luma(235), inset: 8pt, radius: 4pt)
  block(it)
}
