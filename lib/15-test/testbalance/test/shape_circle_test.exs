defmodule Shape.CircleTest do
  use ExUnit.Case
  doctest Shape.Circle

  alias Shape.Circle

  test "create circle" do
    circle = %Circle{radius: 2}
    assert circle.radius == 2
  end

  test "creates circle with create method" do
    try do
      Circle.create(nil)
      raise "The radius must be non-nil"
    rescue
      FunctionClauseError -> nil
    end

    try do
      Circle.create(-2)
      raise "The radius must be positive"
    rescue
      FunctionClauseError -> nil
    end

    try do
      Circle.create(0)
      raise "The radius must greater than zero"
    rescue
      FunctionClauseError -> nil
    end

    circle = Circle.create(1.5)
    assert Circle.area(circle) == 1.5 * 1.5 * :math.pi()
  end

end
