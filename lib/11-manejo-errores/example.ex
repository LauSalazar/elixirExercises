defmodule Example do

  def create() do
    spawn(fn -> loop() end)
  end
  def loop() do
    receive do
      {:ok, from_pid, millis} ->
        Process.sleep(millis)
        send(from_pid, :ok)
        loop()

        {:error, from_pid, millis} ->
          Process.sleep(millis)
          try do
            raise MyCustomError, message: "Error desde exercise"
          rescue
            e -> send(from_pid, {:error, e.message})
          end

          send(from_pid, :error)
          loop()
    end
  end
 end
