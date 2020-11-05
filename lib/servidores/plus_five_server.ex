defmodule PlusFiveServer do

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
        :original => original
      } -> send(nextPid,
                    %{:value => x+5, :original => original}
      )
    end
  end
end
