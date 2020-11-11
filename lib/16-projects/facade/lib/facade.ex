defmodule Facade do
  use GenServer

  def initialState(initial_state \\ 0) do
    GenServer.start_link(__MODULE__, initial_state)
  end

  def init(state) do
    {:ok, state}
  end

  def startServer(server) do
    GenServer.call(server, {server, :start})
  end

  def stopServer(server) do
    GenServer.call(server, {server, :stop})
  end

  def handle_call({server, :start}, __from_id, state) do
    FacadeProtocol.startServerFacade(server)
    {:reply, state}
  end

  def handle_call({server, :stop}, __from_id, state) do
    FacadeProtocol.stopServerFacade(server)
    {:reply, state}
  end

  defprotocol FacadeProtocol do
    def startServerFacade(server)
    def stopServerFacade(server)
  end

  defmodule FacadeImpl do
    defstruct [:name]
  end

  defimpl FacadeProtocol, for: FacadeImpl do
    def startServerFacade(server) do
      Facade.readySistemConfigFile(server)
      Facade.initF(server)
      Facade.initializeContext(server)
    end
    def stopServerFacade(server) do
      Facade.destroy(server)
      Facade.shutDown(server)
    end
  end

  def readySistemConfigFile(server) do
    IO.puts("Ready system config file... #{server.name}")
    Process.sleep(50)
    IO.puts("Config files ok #{server.name}")
  end

  def initF(server) do
    IO.puts("Initializating #{server.name}")
  end

  def initializeContext(server) do
    IO.puts("Initializating context #{server.name}")
  end

  def destroy(server) do
    IO.puts("Destroy #{server.name}")
  end

  def shutDown(server) do
    IO.puts("Shutdown #{server.name}")
  end
end
