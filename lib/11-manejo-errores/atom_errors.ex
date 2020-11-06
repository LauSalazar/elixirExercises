readFile = fn filename ->
  case File.read(filename) do
    {:ok, data} -> IO.puts(data)
    {:error, reason} -> IO.puts("error because of #{reason}")
  end
end

readFile.("atom_errors.e")
IO.puts("---------------")
readFile.("atom_errors.ex")
