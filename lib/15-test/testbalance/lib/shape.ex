defmodule Shape do

  defmodule Circle do
    @enforce_keys [:radius]
    defstruct [:radius]

    def create(radius) when radius != nil and radius > 0 do
      %Circle{radius: radius}
    end

    def perimeter(circle) when circle.__struct__ == Circle do
      2 * circle.radius * :math.pi()
    end

    def area(circle) when circle.__struct__ == Circle do
      :math.pi() * circle.radius * circle.radius
    end

  end

  defmodule Rectangle do
    @enforce_keys [:width, :height]
    defstruct [:width, :height]

    defguard is_positive(n) when is_number(n) and n > 0

    def create(w, h) when is_positive(w) and is_positive(h) do
      %Rectangle{width: w, height: h}
    end

    def perimeter(rectangle) when rectangle. __struct__ == Rectangle do
      2 * (rectangle.width + rectangle.height)
    end

    @spec area(%{height: number, width: number}) :: number
    def area(rectangle) when rectangle.__struct__ == Rectangle do
      rectangle.width * rectangle.height
    end
  end

  def create(:circle, map) do
    Circle.create(map.radius)
  end

  def create(:rectangle, %{width: w, height: h}) do
    Rectangle.create(w, h)
  end

  def create(:square, %{size: s}) do
    Rectangle.create(s, s)
  end

  def perimeter(circle) when circle.__struct__ == Circle do
    Circle.perimeter(circle)
  end

  def perimeter(rectangle) when rectangle. __struct__ == Rectangle do
    Rectangle.perimeter(rectangle)
  end

  def area(circle) when circle.__struct__ == Circle do
    Circle.area(circle)
  end

  def area(rectangle) when rectangle.__struct__ == Rectangle do
    Rectangle.area(rectangle)
  end

end
