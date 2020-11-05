require Pokemon_data

defmodule Pokemon do
  @url_api "https://pokeapi.co/api/v2"
  @general "/pokemon/"

  def get_pokemons(ids) do
    ids
    |> Enum.map(&(parse_pokemon(&1)))
  end

  defp fetch_pokemon(id) do
    
  end

  def get_pokemon(id) do
    url = @url_api <> @general <> "#{id}"
    %{:body => body, :status_code => 200} = HTTPoison.get! url
    body |> parse_pokemon
  end

  defp parse_pokemon(body) do
    {:ok, json} = Poison.dedoce(body)
    map = json["sprites"]
    %Pokemon_data{
      :id => json["id"],
      :name => json["name"],
      :thumbnail => map["front_default"],
      :types => map["types"]
    }

  end

  defp get_url(types) do
    types 
    |> Enum.map(&(&1["type"]["url"]))
    |> Enum.map( fn url -> fetch_url(url) end)
  end

  defp fetch_url(url) do
    %{:body => body, :status_code => 200} = HTTPoison.get! url
    body
   
  end

  defp parse_pokemon_types(body) do
    body
  end

end

"""
Le paso una lista de ids de pokemons
1 .. 451
devolver una lista [1,2,3]
con : - Nombres
      - thumbnail
      - id
      - typos: 
            - name:
 			- ventajas
       - desventajas

"""
