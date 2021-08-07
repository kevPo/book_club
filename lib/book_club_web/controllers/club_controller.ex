defmodule BookClubWeb.ClubController do
  use BookClubWeb, :controller

  alias BookClub.BookClubs
  alias BookClub.BookClubs.Club

  def index(conn, _params) do
    clubs = BookClubs.list_clubs()
    render(conn, "index.html", clubs: clubs)
  end

  def new(conn, _params) do
    changeset = BookClubs.change_club(%Club{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"club" => club_params}) do
    case BookClubs.create_club(club_params) do
      {:ok, club} ->
        conn
        |> put_flash(:info, "Club created successfully.")
        |> redirect(to: Routes.club_path(conn, :show, club))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    club = BookClubs.get_club!(id)
    render(conn, "show.html", club: club)
  end

  def edit(conn, %{"id" => id}) do
    club = BookClubs.get_club!(id)
    changeset = BookClubs.change_club(club)
    render(conn, "edit.html", club: club, changeset: changeset)
  end

  def update(conn, %{"id" => id, "club" => club_params}) do
    club = BookClubs.get_club!(id)

    case BookClubs.update_club(club, club_params) do
      {:ok, club} ->
        conn
        |> put_flash(:info, "Club updated successfully.")
        |> redirect(to: Routes.club_path(conn, :show, club))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", club: club, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    club = BookClubs.get_club!(id)
    {:ok, _club} = BookClubs.delete_club(club)

    conn
    |> put_flash(:info, "Club deleted successfully.")
    |> redirect(to: Routes.club_path(conn, :index))
  end
end
