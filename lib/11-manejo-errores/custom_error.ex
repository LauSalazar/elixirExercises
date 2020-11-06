defmodule MyCustomError do
  defexception [:message, country: "Colombia"]
end

defmodule MyDefaultError do
  defexception message: "Error por defecto"
end

#raise MyCustomError, message: "Error personalizado"
#raise MyDefaultError

#raise ArgumentError
#raise ArgumentError, message "me quede sin argumentos"
#raise RuntimeError, message: "hola"
