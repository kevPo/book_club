defmodule BookClub.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string, null: false
      add :pages, :integer, null: false
      add :image_url, :string
      add :club_id, references(:clubs), null: false

      timestamps()
    end

  end
end
