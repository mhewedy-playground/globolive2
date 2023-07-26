defmodule Globolive2.Core.Event do
  @moduledoc false

  alias Globolive2.Core.{Attraction, Visitor}

  @type t :: %__MODULE__{
          name: String.t(),
          location: String.t(),
          start: DateTime.t(),
          finish: DateTime.t(),
          attractions: [Attraction.t()],
          attraction_count: non_neg_integer
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
    %__MODULE__{name: name} = event
    name
  end

  @doc """
  Add a new attraction with the given attributes to an event.
  """
  @spec add_attraction(t, Enum.t()) :: t
  def add_attraction(event, attraction_attributes) do
    attraction = Attraction.new(attraction_attributes)

    %__MODULE__{
      event
      | attractions: [attraction | event.attractions],
        attraction_count: event.attraction_count + 1
    }
  end

  @doc """
  Get an attraction based on its ID.
  """
  @spec get_attraction(t, String.t()) :: Attraction.t() | nil
  def get_attraction(event, attraction_name) do
    %__MODULE__{attractions: attractions} = event
    Enum.find(attractions, fn attraction -> Attraction.id(attraction) == attraction_name end)
  end

  @doc """
  Remove an attraction, e.g. when a visitor checks in to it.
  """
  @spec remove_attraction(t, Attraction.t()) :: t
  def remove_attraction(event, attraction) do
    attractions = Enum.reject(event.attractions, &(attraction == &1))

    %__MODULE__{
      event
      | attractions: attractions,
        attraction_count: length(attractions)
    }
  end
end
