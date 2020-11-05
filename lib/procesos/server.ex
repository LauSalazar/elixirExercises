defmodule Server do

  def start do
    spawn(fn -> loop() end)
  end

  def loop do
    op()
    loop()
  end

  def op do
    receive do
      {:value, x} ->
        IO.puts(x+5)
    end
  end
end
