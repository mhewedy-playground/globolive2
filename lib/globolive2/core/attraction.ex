defmodule Globolive2.Core.Attraction do
  @moduledoc false

  @type t :: %__MODULE__{
          name: String.t(),
          start: DateTime.t(),
          finish: DateTime.t(),
          location: String.t()
        }

  @enforce_keys [:name, :start, :finish, :location]
  defstruct [:name, :start, :finish, :location]

  @doc """
  Create a new attraction with the given attributes.
  """
  def new(attributes) do
    struct!(__MODULE__, attributes)
  end

  @doc """
  Return identifying information about the given attraction for use in other parts of the application.
  """
  @spec id(t) :: String.t()
  def id(attraction) do
    # TODO
  end
end
