defmodule State2Server do

  def start do
    spawn( fn -> loop(%{}) end  )
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

  #funcion de ayuda
  def put(pid, key, value) do
    send(pid, {:get, key, value})
  end

  @spec get(atom | pid | port | {atom, atom}, any, any) :: any
  def get(pid, key, value) do
    send(pid, {:get, key, value})
    receive do
      {:response, value} -> value
    end
  end

  defp process(actual, {:put, key, value}) do
    Map.put(actual, key, value)
  end

  defp process(actual, {:get, key, pid}) do
    send(pid, {:response, Map.get(actual, key)})
    actual
  end
end
