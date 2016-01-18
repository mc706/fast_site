defmodule FastSite.Repo.Migrations.CreateQIP do
  use Ecto.Migration

  def change do
    create table(:qips) do
      add :date, :datetime
      add :number, :integer
      add :description, :string
      add :resolution, :string
      add :status, :string
      add :date_closed, :datetime


      timestamps
    end

  end
end
