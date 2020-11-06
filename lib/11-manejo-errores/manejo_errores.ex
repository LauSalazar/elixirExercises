IO.puts("1------------------")

try do
  :bar / 2
rescue
  RuntimeError -> IO.puts("There was a runtime error")
  ArithmeticError -> IO.puts("The division was not possible")
end

IO.puts("2------------------")
#Por defecto todo error tiene el campo message

try do
  :bar / 2
rescue
  RuntimeError -> IO.puts("There was a runtime error")
  e in ArithmeticError -> IO.puts("The division was not possible #{e.message}")
end

IO.puts("3------------------")

try do
  raise MyCustomError, message: "My custom error"
rescue
  e in MyCustomError -> IO.puts("message: #{e.message}, country: #{e.country}")
end

try do
  raise MyCustomError, message: "My custom error", country: "Canada"
rescue
  e in MyCustomError -> IO.puts("message: #{e.message}, country: #{e.country}")
end
