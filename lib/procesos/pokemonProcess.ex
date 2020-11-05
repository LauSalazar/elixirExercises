defmodule PokemonServer do
  @url_api "https://pokeapi.co/api/v2"
  @general "/pokemon/"

  def start do
    spawn(fn -> loop() end)
  end

  def loop do
    op()
    loop()
  end

  def op do
    receive do
      {:value, x} ->
        {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get(@url_api <> @general <> "#{x}")
      data = Poison.decode!(body)
      IO.puts(data["name"])
    end
  end
end
