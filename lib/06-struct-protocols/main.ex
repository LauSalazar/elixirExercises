alias Geometry.Rectangle
alias Geometry.Circle
alias Geometry.Shape

IO.puts(Shape.area(%Rectangle{b: 3, h: 4}))
IO.puts(Shape.perimeter(%Rectangle{b: 3, h: 4}))
IO.puts(Shape.area(%Circle{r: 2}))
IO.puts(Shape.perimeter(%Circle{r: 2}))
IO.puts(Shape.area(1))
