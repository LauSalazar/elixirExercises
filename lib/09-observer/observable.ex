  defmodule Observable do

    @spec create(integer()) :: pid()
    def create(initialState \\ 0) do
      spawn(__MODULE__, :listen, [[], initialState])
    end

    def listen(observers, state) do
      receive do
        {:attach, observer_pid} ->
          #observers = add_observer(observers, observer_pid)
          #listen(observers, state)
          observers |> add_observer(observer_pid) |> listen(state)
        {:detach, observer_pid} ->
          #observers = remove_observer(observers, observer_pid)
          #listen(observers, state)
          observers |> remove_observer(observer_pid) |> listen(state)

        {:increment} ->
          state = state+1
          nofify(observers, state)
          listen(observers, state)

        {:decrement} ->
          state = state - 1
          nofify(observers, state)
          listen(observers, state)

          {:read, reader_pid} ->
            send(reader_pid,state)
            listen(observers, state)

      end
    end

    def add_observer(observers, observer_pid) do
      [observer_pid | observers]
    end

    def remove_observer(observers, observer_pid) do
      observers -- [observer_pid]
    end

    defp nofify(observers, state) do
      observers |> Enum.each(&send(&1,state))
    end

    def attach(subject) do
      send(subject, {:attach, self()})
    end

    def detach(subject) do
      send(subject, {:detach, self()})
    end

    def increment(subject) do
      send(subject, {:increment})
    end

    def decrement(subject) do
      send(subject, {:decrement})
    end

    def read(subject) do
      send(subject, {:read,self()})
      await()
    end

    def await() do
      receive do
        count -> count
      end
    end





end


#subject = Observable.create()
#send(subject, {:attach, self()})
#send(subject, {:increment})
#count = Observable.receive
