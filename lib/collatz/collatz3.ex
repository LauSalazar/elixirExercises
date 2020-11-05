defmodule Collatz3 do

  def collatz(1) do
    IO.puts(1)
    1
  end
  def collatz(n) when rem(n,2) == 0 do
    IO.puts(n)
    collatz(round(n/2))
  end
  def collatz(n) do
    IO.puts(n)
    collatz(3 * n + 1)
  end
end

Collatz3.collatz(20)
