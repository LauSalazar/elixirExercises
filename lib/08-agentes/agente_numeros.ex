defmodule AgenteNumeros do
  use Agent

  def start do
    Agent.start_link(fn -> %{:pares => [], :impares => []} end, name: __MODULE__)
  end

  def add(value) do
    Agent.update(__MODULE__, fn actual -> process(actual, {:number, value}) end)
  end

  def get(key) do
    Agent.get(__MODULE__, fn actual -> Map.get(actual,key) end)
  end

  def process(current, {:number, value}) do
    cond do
      rem(value, 2) == 0 -> get_new_map(current, :pares, value)
      true -> get_new_map(current, :impares, value)
    end
  end

  #key puede ser :pares o :impares
  def get_new_map(current, key, value) do
    map = Map.get(current, key)
    new_map = map ++ [value]
    Map.put(current, key, new_map)
  end

end


#AgenteNumeros.start()
#AgenteNumeros.add(2)
#AgenteNumeros.add(3)
#AgenteNumeros.get(:pares)
#AgenteNumeros.get(:impares)
