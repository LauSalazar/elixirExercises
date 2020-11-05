defmodule TimesSevenServer do

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
        :original => original
      } -> send(original,
                    %{:value => x*7}
      )
    end
  end
end
