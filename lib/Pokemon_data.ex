defmodule Pokemon_data do
    defstruct [:id, :name,  :thumbnail, types: [:Type]]
end

defmodule Type do
    defstruct [:name]
end