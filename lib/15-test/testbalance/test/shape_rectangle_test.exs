defmodule Shape.RectangleTest do
  use ExUnit.Case
  doctest Shape.Rectangle

  alias Shape.Rectangle

  test "is_positive must work" do
    assert !Rectangle.is_positive(nil)
    assert !Rectangle.is_positive(-2)
    assert !Rectangle.is_positive(0)
    assert Rectangle.is_positive(3.0)
  end

  test "create Rectangle" do
    rect = %Rectangle{width: 2, height: 3}
    assert rect.width == 2
    assert rect.height == 3
  end

  test "creates rectangle with create method" do

    try do
      Rectangle.create(nil, nil)
      raise "Width and height must be non.nil"
    rescue
      FunctionClauseError -> nil
    end

    try do
      Rectangle.create(0, 0)
      raise "Width and height must be greater than zero"
    rescue
      FunctionClauseError -> nil
    end

    rect = Rectangle.create(3,4)
    assert Rectangle.perimeter(rect) == 14
    assert Rectangle.area(rect) == 12
  end

end
