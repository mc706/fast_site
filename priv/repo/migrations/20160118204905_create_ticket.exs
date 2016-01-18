defmodule FastSite.Repo.Migrations.CreateTicket do
  use Ecto.Migration

  def change do
    create table(:tickets) do
      add :title, :string
      add :description, :string
      add :status, :string
      add :date, :datetime

      timestamps
    end

  end
end
