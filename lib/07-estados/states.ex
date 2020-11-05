defmodule StateServer do

  def start do
    spawn( fn -> loop(0) end  )
  end

  def loop(var) do
    x = operation(var)
    IO.puts(x)
    loop(x)
  end

  def operation(m) do
    receive do
      _ -> m + 1 #contador
      #x -> m + x #acumulador
    end
  end

end
