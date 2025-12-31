#set page(paper: "A4", numbering: "1")
#set text(font: "Linux Libertine", size: 10pt, columns: 2)


= My First Typst Doc

== My Second Heading

Hello! This is *strong* and this is _emphasis_. 
Here is a formula: $ A = pi r^2 $

#table(
  columns: (1fr, auto),
  inset: 10pt,
  align: center,
  "Item", "Price", // Table Header
  "Coffee", "$2.50", // First Row
  "Donut", "$1.550", // Second Row
)
