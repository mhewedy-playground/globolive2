defmodule Globolive2Test do
  alias Globolive2.Core.{Event, Attraction}
  import Globolive2.Factory

  use ExUnit.Case
  doctest Globolive2

  describe "add_attraction/2" do
    test "adds a new attraction to an event" do
      # Given:
      att_fields = attraction_fields()

      event =
        Event.new(event_fields())
        |> Event.add_attraction(att_fields)

      # When:
      %Event{attractions: attraction, attraction_count: attraction_count} = event

      # Then:
      assert attraction_count == 1
      assert attraction == [Attraction.new(att_fields)]
    end

    test "adds a new attraction to an event exiting event" do
      # Given:
      att_fields = attraction_fields()

      event =
        Event.new(event_fields())
        |> Event.add_attraction(att_fields)
        |> Event.add_attraction(att_fields)

      # When:
      %Event{attractions: attraction, attraction_count: attraction_count} = event

      # Then:
      assert attraction_count == 2
      assert attraction == [Attraction.new(att_fields) | [Attraction.new(att_fields)]]
    end

    test "remove a new attraction to an event exiting event" do
      # Given:
      att_fields = attraction_fields()
      to_remove_attraction = %{att_fields | name: "to_remove_attraction"}

      event =
        Event.new(event_fields())
        |> Event.add_attraction(att_fields)
        |> Event.add_attraction(to_remove_attraction)
        |> Event.remove_attraction(Attraction.new(to_remove_attraction))

      # When:
      %Event{attractions: attraction, attraction_count: attraction_count} = event

      # Then
      assert attraction_count == 1
      assert attraction == [Attraction.new(att_fields)]
    end
  end
end
