defmodule Factorial do
  def fact1(n) when is_integer(n) do
    cond do
      n < 2 -> 1
      true -> n * fact1(n-1)
    end
  end

  # acc = 1
  # for(int i = 0; i<n; i++){
    #acc *=(i+1);
  #}
  defp factp2(n, i, acc) do
    cond do
      i == n -> acc
      true -> factp2(n, i + 1, acc * (i+1))
    end
  end

  def fact2(n) do
    factp2(n, 0, 1)
  end

  def fact3(n) do
    cond do
      n<1 -> 1
      true -> factp3(n-1, n)
    end
  end

  defp factp3(0,acc) do
    acc
  end

  defp factp3(n, acc) do
    factp3(n-1, acc * n)
  end

  def fact_TCO(n) when n > 0, do: factTCO(n, 1)
  defp factTCO(1, acc), do: acc
  defp factTCO(n, acc), do: factTCO(n - 1, n * acc)

end

IO.puts(Factorial.fact1(4))
IO.puts(Factorial.fact2(4))
