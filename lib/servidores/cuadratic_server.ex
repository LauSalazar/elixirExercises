defmodule CuadraticServer do

  def start do
    spawn(fn -> loop() end)
  end

  def loop do
    operation()
    loop()
  end

  def operation do
    receive do
      %{
        :value => x,
        :next => nextPid,
        :secondPid => secondPid,
        :original => original
      } -> send(nextPid,
                    %{:value => x*x, :next => secondPid, :original => original}
      )
    end
  end
end
