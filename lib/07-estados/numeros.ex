defmodule NumerosServer do

  def start do
    initial_state = %{:pares => [], :impares => []}
    spawn( fn -> loop(initial_state) end)
  end

  def loop(current) do
    new_state = operation(current)
    loop(new_state)
  end

  #Funciones de ayuda
  def get_pares(pid) do
    send(pid, {:get, :pares, self() })
    receive do
      {:response, value} -> IO.inspect(value)
    end
  end

  def get_impares(pid) do
    send(pid, {:get, :impares, self() })
    receive do
      {:response, value} -> IO.inspect(value)
    end
  end
  def operation(current) do
    receive do
      numero -> process(current, numero)
    end
  end

  def process(current, {:number, value}) do
    cond do
      rem(value, 2) == 0 -> get_new_map(current, :pares, value)
      true -> get_new_map(current, :impares, value)
    end
  end

  def get_new_map(current, key, value) do
    map = Map.get(current, key)
    new_map = map ++ [value]
    Map.put(current, key, new_map)
  end

  def add(pid, number) do
    send(pid, {:number, number})
  end

end
