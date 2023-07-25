defmodule Globolive2.Core.Visitor do
  @moduledoc false

  alias Globolive2.Core.{Attraction, Event}

  @type t :: %__MODULE__{
          name: String.t(),
          email: String.t(),
          event: Event.t(),
          arrived_at: DateTime.t() | nil,
          visited: MapSet.t(Attraction.t())
        }

  @enforce_keys [:name, :email, :event]
  defstruct name: nil,
            email: nil,
            event: nil,
            arrived_at: nil,
            visited: MapSet.new()

  @spec new(String.t(), String.t(), Event.t()) :: t
  def new(name, email, event) do
    %__MODULE__{
      name: name,
      email: email,
      event: event
    }
  end

  @doc """
  Check whether the visitor has arrived at the event.
  """
  @spec arrived?(t) :: boolean
  def arrived?(visitor) do
    # TODO
  end

  @doc """
  Get the event for the given visitor.
  """
  @spec get_event(t) :: Event.t()
  def get_event(visitor) do
    # TODO
  end

  @doc """
  Return identifying information about the given visitor for use in other parts of the application.
  """
  @spec id(t) :: {String.t(), String.t()}
  def id(visitor) do
    # TODO
  end

  @doc """
  Mark a visitor as checked in at the event.
  """
  @spec mark_arrived(t, DateTime.t()) :: t
  def mark_arrived(visitor, timestamp) do
    # TODO
  end

  @doc """
  Mark a visitor as having checked in at an attraction.
  """
  @spec mark_checkin(t, Attraction.t()) :: t
  def mark_checkin(visitor, attraction) do
    # TODO
  end

  @doc """
  Check whether a visitor has visited the given attraction.
  """
  @spec visited?(t, Attraction.t()) :: boolean
  def visited?(visitor, attraction) do
    # TODO
  end
end
