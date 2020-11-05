defmodule AgenteMapas do
  use Agent

  def start() do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def get(key) do
    Agent.get(__MODULE__, fn actual -> Map.get(actual,key) end)
  end

  def add(key, value) do
    Agent.update(__MODULE__, fn actual -> Map.put(actual, key, value) end)
  end
end


#AgenteMapas.start()
#AgenteMapas.add(:key, "5")
#AgenteMapas.get(:key)
