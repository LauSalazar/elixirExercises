defmodule EsPrimo do

  def es_primo?(val) when is_integer(val) do
    es_primo_p?(val,2,rem(val,2))
  end

  defp es_primo_p?(1,_div,_res), do: true

  defp es_primo_p?(val,val,_res), do: true

  defp es_primo_p?(_val,_div,0), do: false

  defp es_primo_p?(val, div, _res) do
    es_primo_p?(val, div+1,rem(val,div+1))
  end
end
