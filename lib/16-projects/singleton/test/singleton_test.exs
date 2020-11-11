defmodule MySingletonTest do
  use ExUnit.Case
  doctest MySingleton

  test "create singleton" do
    MySingleton.start_link("Hello")
    assert MySingleton.read() == "Hello"

    assert MySingleton.write("Hello") == :ok
    assert MySingleton.read() == "Hello"
  end

  test "multiple declarations" do
    {:ok, single_pid} = MySingleton.start_link("Hello")
    {:error, {:already_started, ^single_pid}} = MySingleton.start_link("Hallo")

    assert MySingleton.read() == "Hello"

  end
end
