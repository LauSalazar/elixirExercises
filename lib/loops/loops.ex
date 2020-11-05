defmodule Loops do

  #int i = 0
  #while(true){
  # if(i<n) break
  #
  def for_loop(i, n, value) do
    cond do
      i < n ->
        IO.puts("#{value} #{i}")
        for_loop(i+1, n, value)

      true -> :ok
    end
  end

  # while(true){
  # println(value)
  # if(!cond){
  #   break
  # }
  #}
  def do_while(i, n, value) when i < n do
    IO.puts("#{value} #{i}")
    do_while(i + 1, n, value)
  end

  def do_while(i, n, value) do
    :ok
  end

  def do_while2(n, value) do
    cond do
      n > 0 ->
        IO.puts("#{value} #{n}")
        do_while2(n - 1, value)
      true ->
        :ok
    end
  end

  def do_while3(i, n, value) do
    IO.puts("#{value} #{i}")
    cond do
      i + 1  < n -> do_while3(i + 1, n ,value)
      true -> :ok
    end
  end

end

Loops.for_loop(0, 6, "Valor")
Loops.do_while3(0,1,"While3")
