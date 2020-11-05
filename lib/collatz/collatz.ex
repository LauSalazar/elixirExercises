defmodule Collatz do
  def collatz1(n) when is_integer(n) do
    IO.puts(n)
    IO.inspect(Process.info(self(), :current_stacktrace))
    z = cond do
      n == 1 -> 1
      rem(n,2) == 0 -> collatz1(round(n/2))
      true -> collatz1(3 * n + 1)
    end

    z
  end
end

Collatz.collatz1(20)
