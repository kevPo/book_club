defmodule BookClub.Repo.Migrations.CreateClubs do
  use Ecto.Migration

  def change do
    create table(:clubs) do
      add :title, :string
      add :user_id, references(:users), null: false

      timestamps()
    end

    create index(:clubs, [:user_id])
  end
end
