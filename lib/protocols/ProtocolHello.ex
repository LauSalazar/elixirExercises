defmodule Person do
  defstruct [:name, :age]
end

defprotocol ProtocolName do
  def function_name(param)
  def function_age(param)
end

defimpl ProtocolName, for: Person do
  def function_age(param) do
    IO.puts(param.name <> "is" <> "#{param.age}" <> "years old")
  end
  def function_name(param) do
    IO.puts("Hello "<>param.name)
  end
end

#ProtocolName.function_name(Person)
