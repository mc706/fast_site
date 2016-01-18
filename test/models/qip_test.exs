defmodule FastSite.QIPTest do
  use FastSite.ModelCase

  alias FastSite.QIP

  @valid_attrs %{date: "2010-04-17 14:00:00", description: "some content", number: 42, resolution: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = QIP.changeset(%QIP{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = QIP.changeset(%QIP{}, @invalid_attrs)
    refute changeset.valid?
  end
end
