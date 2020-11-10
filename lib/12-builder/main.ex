import CreateUser

user = create_user()
|> name("Laura", "Salazar")
|> country("Colombia")
|> languages(["spanish","portugues"])


inspect(user) |> IO.puts
