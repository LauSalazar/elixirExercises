double = fn x -> 2 * x end #multiplica por dos
filter = fn n -> rem(n, 4) == 0 end #multiplos de 4
triple = fn x -> 3 * x end #multiplica por 3
list = 0..7

result_enum = Enum.filter(Enum.map(list,double), filter)
result_enum1 = list |> Enum.map(double) |> Enum.filter(filter)

IO.puts("#{inspect(result_enum)}")
IO.puts("#{inspect(result_enum1)}")
IO.puts("----------------------------")

#Los enum actuan de manera inmediata (Eager)
#Los stream actuan de manera ociosa (lazy)
resultEnum = list |> Enum.map(double) |> Enum.map(triple) |> Enum.filter(filter)
IO.puts("#{inspect(resultEnum)}")
IO.puts("----------------------------")

resultStream = list |> Stream.map(double) |> Stream.map(triple) |> Enum.filter(filter)
IO.puts("#{inspect(resultStream)}")

IO.puts("----------------------------")
result = 0..7 |> Stream.drop(2) |> Enum.take(3)
IO.puts("#{inspect(result)}")
