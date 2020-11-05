defmodule Ignicion do
  def func_ignicion(n) do
    # Recorrer de n a 1
    # imprimir cada valor
    # terminar con la palabra ignicion
    for x <- n..0, do: IO.puts x
    IO.puts("Ignicion")
  end
end
