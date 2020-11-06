b = Example.create()
IO.puts("Section 1")
send(b, {:ok, self(), 1000})
IO.puts("b << :ok, 1000")

receive do
  :ok -> IO.puts("b respond in one second")
end

IO.puts("Section 2")
send(b, {:ok, self(), 4000})
IO.puts("b << :ok, 4000")

receive do
  :ok -> IO.puts("b respond in one second")
after
  1000 -> IO.puts("Timeout 1000ms")
end

receive do
  :ok -> IO.puts("b respond in one second")
end

IO.puts("Section 3")
send(b, {:error, self(), 1000})

receive do
  {:error, message} -> IO.puts("b respond error #{message}")
after
  2000 -> IO.puts("Timeout 2000ms")
end

IO.puts("Section 4")

try do
  IO.puts("This is not an error")
rescue
  _ -> IO.puts("This is never printed first")
after
  IO.puts("This is always printed first")
end

try do
  raise "There was an error"
rescue
  _ -> IO.puts("This is never printed")
after
  IO.puts("This is always printed")
end


IO.puts("Section 5")
#Rescue me rescata de errores
#Catch captura cualquier cosa que se envie

try do
  IO.puts("this is not an error")
catch
  e -> IO.puts("Never printed: #{e}")
after
  IO.puts("always printed")
end

try do
  throw(456_154)
  IO.puts("This is never printed")
catch
  e -> IO.puts("Never printed: #{e}")
after
  IO.puts("always printed")
end

IO.puts("Section 5")

try do
  raise "hola"
  IO.puts("This is never printed")
rescue
  e -> IO.puts("from rescue: #{e.message}")
catch
  e -> IO.puts("from catch: #{e}")
after
  IO.puts("always printed")
end

try do
  throw("hola")
  IO.puts("This is never printed")
rescue
  e -> IO.puts("from rescue: #{e.message}")
catch
  e -> IO.puts("from catch: #{e}")
after
  IO.puts("always printed")
end
