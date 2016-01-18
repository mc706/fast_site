defmodule FastSite.QIP do
  use FastSite.Web, :model

  schema "qips" do
    field :date, Ecto.DateTime
    field :number, :integer
    field :description, :string
    field :resolution, :string
    field :status, :string
    field :date_closed, Ecto.DateTime

    timestamps
  end

  @required_fields ~w(date number description resolution)
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
