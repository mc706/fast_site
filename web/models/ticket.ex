defmodule FastSite.Ticket do
  use FastSite.Web, :model

  schema "tickets" do
    field :title, :string
    field :description, :string
    field :status, :string
    field :date, Ecto.DateTime

    timestamps
  end

  @required_fields ~w(title description status date)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end