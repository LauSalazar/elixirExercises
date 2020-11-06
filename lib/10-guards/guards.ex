defmodule MyGuards do

  defguard is_event(n) when is_integer(n) and rem(n,2) == 0

  def div2(n) when is_integer(n) and rem(n,2) == 0 do
    round(n/2)
  end

  def half_of(n) when is_event(n) do
    round(n/2)
  end
end
