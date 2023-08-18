defmodule Exmeal.Error do
  @keys [:status, :result]

  @enforce_keys @keys

  defstruct @keys

  def build(status, result) do
    {:error,
     %__MODULE__{
       status: status,
       result: result
     }}
  end
end
