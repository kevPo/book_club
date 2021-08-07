defmodule BookClub.BookClubs.Club do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clubs" do
    field :title, :string
    belongs_to :user, BookClub.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(club, attrs) do
    club
    |> cast(attrs, [:title])
    |> validate_required([:title])
    |> assoc_constraint(:user)
  end
end
