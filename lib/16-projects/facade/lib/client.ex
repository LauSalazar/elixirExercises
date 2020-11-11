alias Facade

server= %Facade.FacadeImpl{name: "server1"}
IO.inspect(server)
{:ok, s} = Facade.initialState()
IO.inspect(s)
