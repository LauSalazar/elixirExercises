defmodule AgenteContador do
  use Agent

  def start_link() do
    IO.puts(__MODULE__)
    Agent.start_link(fn -> 0 end, name: __MODULE__) #define un nombre :Elixir.agenteContador

  end

  def get do
    Agent.get(__MODULE__, fn x->x end)
  end

  def add do
    Agent.update(__MODULE__, fn x -> x+1 end)
  end


end


#AgenteContador.start_link()
#AgenteContador.add()
#AgenteContador.get()
