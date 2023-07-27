defmodule Globolive2.Factory do
  alias Globolive2.Core.{Attraction, Event, Visitor}

  def event_fields(attributes \\ %{}),
    do:
      %{
        name: "GLobo LIVE",
        location: "Some avenue",
        start: DateTime.utc_now(),
        finish: DateTime.utc_now() |> DateTime.add(10 * 60 * 60, :second)
      }
      |> Map.merge(attributes)

  def attraction_fields(attributes \\ %{}),
    do:
      %{
        name: "An Attraction",
        location: "Some avenue",
        start: DateTime.utc_now(),
        finish: DateTime.utc_now() |> DateTime.add(10 * 60 * 60, :second)
      }
      |> Map.merge(attributes)

  def event_with_attraction(event_attributes, attraction_attributes) do
    event_attributes
    |> event_fields
    |> Event.new()
    |> Event.add_attraction(attraction_attributes)
  end
end
