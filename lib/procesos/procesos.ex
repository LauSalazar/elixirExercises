defmodule Procesos do
  def start do
    spawn(fn -> IO.puts("Hola mundo") end) #devuelve el process id
  end

  def read do
    receive do
      var -> IO.puts(var)
    end
  end

  def sent(pid) do
    send(pid, "test")
  end

  def current_process do
    self()
  end

  def tarea do
    task = Task.async(fn ->
      Process.sleep(10000)
      IO.puts("Hola mundo")
    end
    )
    task
  end

end

#Process.alive?(pid)
#Process.register pid, :pid

#task : sirve tambien para lanzar procesos
#task = Task.async(fn -> IO.puts("hello") end)
