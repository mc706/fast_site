defmodule FastSite.TicketTest do
  use FastSite.ModelCase

  alias FastSite.Ticket

  @valid_attrs %{date: "2010-04-17 14:00:00", description: "some content", status: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Ticket.changeset(%Ticket{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Ticket.changeset(%Ticket{}, @invalid_attrs)
    refute changeset.valid?
  end
end
