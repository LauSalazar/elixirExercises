defmodule User do
  defstruct [:name,  :lastName, :country, languages: [:Language], programmingLanguages: [:ProgrammingLanguage]]
end

defmodule Language do
  defstruct [:name]
end

defmodule ProgrammingLanguage do
  defstruct [:name]
end

defmodule CreateUser do
  def create_user(name, lastName, country, languages, programmingL) do
    %User{
      :name => name,
      :lastName => lastName,
      :country => country,
      :languages => languages,
      :programmingLanguages => programmingL
    }
  end
  def create_user() do
    %User{}
  end
  def name(user, name, lastName) do
    user |> Map.put(:name, name) |> Map.put(:lastName, lastName)
  end
  def country(user,country) do
    Map.put(user, :country, country)
  end
  def languages(user, languages) do
    Map.put(user, :languages, languages)
  end

end
