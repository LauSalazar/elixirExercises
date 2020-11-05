defmodule CalculosMath do

  @doc """
  Calcula el area de un rectangulo
  """
  @spec area({number,number},{number,number}) :: number | {:error, String.t}
  def area({x0,y0},{x1,y1}) when (x1-x0 >= 0) and (y1-y0 >=0) do #clausulas de guarda
    (x1-x0) * (y1-y0)
  end

  def area(_x,_y), do: {:error, "Argumentos no validos"}

end
