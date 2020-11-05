defmodule Geometry do

  defmodule Rectangle do
    defstruct b: 1, h: 1
  end

  defmodule Circle do
    defstruct r: 1
  end

  defmodule Hipercube do
    defstruct [:a, :d, b: 1, c: 1]
  end

  defprotocol Shape do
    @fallback_to_any true
    def area(r)
    def perimeter(r)
  end

  defimpl Shape, for: Rectangle do
    def area(r) do
      r.b*r.h
    end

    def perimeter(r) do
      2*r.b + 2*r.h
    end
  end


  defimpl Shape, for: Circle do
    def area(c) do
      :math.pi() * c.r * c.r/2
    end

    def perimeter(c) do
      2 * :math.pi() * c.r
    end
  end


  defimpl Shape, for: Any do
    def area(_) do
      :error
    end

    def perimeter(_) do
      :error
    end
  end

end

#rect = %Rectangle{b: 3, h: 4}
#%Geometry.Rectangle{b: 3, h: 4}
#rect.b
#rect.h


#rect = %Geometry.Rectangle{b: 3, h: 4}
#Geometry.Shape.area(rect)
