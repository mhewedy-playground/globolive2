defmodule Globolive2.Core.Event do
  @moduledoc false

  @type t :: %__MODULE__{
          name: String.t(),
          location: String.t(),
          start: DateTime.t(),
          finish: DateTime.t()
        }

  @enforce_keys [:name, :location, :start, :finish]
  defstruct name: nil,
            location: nil,
            start: nil,
            finish: nil,
            attractions: [],
            attraction_count: 0

  @spec new(Enum.t()) :: t
  def new(attributes) do
    struct!(__MODULE__, attributes)
  end

  @doc """
  Return identifying information about the given event for use in other parts of the application.
  """
  @spec id(t) :: String.t()
  def id(event) do
    # TODO
  end

  @doc """
  Add a new attraction with the given attributes to an event.
  """
  @spec add_attraction(t, Enum.t()) :: t
  def add_attraction(event, attraction_attributes) do
    # TODO
  end

  @doc """
  Get an attraction based on its ID.
  """
  @spec get_attraction(t, String.t()) :: Attraction.t() | nil
  def get_attraction(event, attraction_name) do
    # TODO
  end

  @doc """
  Remove an attraction, e.g. when a visitor checks in to it.
  """
  @spec remove_attraction(t, Attraction.t()) :: t
  def remove_attraction(event, attraction) do
    # TODO
  end
end
