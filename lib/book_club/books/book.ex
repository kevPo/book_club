defmodule BookClub.Books.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :image_url, :string
    field :pages, :integer
    field :title, :string
    belongs_to :club, BookClub.BookClubs.Club

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :pages, :image_url])
    |> validate_required([:title, :pages])
    |> assoc_constraint(:club)
  end
end
