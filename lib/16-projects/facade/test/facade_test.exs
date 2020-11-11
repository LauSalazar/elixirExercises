defmodule FacadeTest do
  use ExUnit.Case
  doctest Facade

  test "start server" do
    server = %Facade.FacadeImpl{name: "server"}
    assert Facade.FacadeProtocol.startServer(server)
  end

  test "stop server" do
    server = %Facade.FacadeImpl{name: "server"}
    assert Facade.FacadeProtocol.stopServer(server)
  end
end
