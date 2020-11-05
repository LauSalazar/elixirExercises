defmodule ParesImpares do

  def start do
    initial_state = %{:pares => [] , :impares => []}
    spawn(fn -> loop(initial_state) end)
  end

  def loop(actual) do
    x = operation(actual)
    loop(x)
  end

  def operation(actual) do
    receive do
      nuevo -> process(actual, nuevo)
    end
  end

  def put(pid, value) do
    send(pid, {:put, value})
  end

  def get(pid, key) do
    send(pid, {:get, key, self()})
    receive do
      {:response, value} -> value
    end
  end

  defp process(actual, {:put, value}) do
    cond do
      rem(value, 2) == 0 -> Map.put(actual, :pares, actual.pares ++ [value])
      true -> Map.put(actual, :impares, actual.impares ++ [value])
    end
  end

  defp process(actual, {:get, key, pid}) do
    send(pid, {:response, Map.get(actual, key)})
    actual
  end
end
