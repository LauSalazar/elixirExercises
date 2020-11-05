defmodule IterString do
  defmodule Map do
    def double(s) do
      "#{s}#{s}"
    end
  end

  def triple(s) do
    "#{s}#{s}#{s}"
  end
end
