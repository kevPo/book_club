defmodule BookClub.BookClubsTest do
  use BookClub.DataCase

  alias BookClub.BookClubs

  describe "clubs" do
    alias BookClub.BookClubs.Club

    @valid_attrs %{title: "some title"}
    @update_attrs %{title: "some updated title"}
    @invalid_attrs %{title: nil}

    def club_fixture(attrs \\ %{}) do
      {:ok, club} =
        attrs
        |> Enum.into(@valid_attrs)
        |> BookClubs.create_club()

      club
    end

    test "list_clubs/0 returns all clubs" do
      club = club_fixture()
      assert BookClubs.list_clubs() == [club]
    end

    test "get_club!/1 returns the club with given id" do
      club = club_fixture()
      assert BookClubs.get_club!(club.id) == club
    end

    test "create_club/1 with valid data creates a club" do
      assert {:ok, %Club{} = club} = BookClubs.create_club(@valid_attrs)
      assert club.title == "some title"
    end

    test "create_club/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = BookClubs.create_club(@invalid_attrs)
    end

    test "update_club/2 with valid data updates the club" do
      club = club_fixture()
      assert {:ok, %Club{} = club} = BookClubs.update_club(club, @update_attrs)
      assert club.title == "some updated title"
    end

    test "update_club/2 with invalid data returns error changeset" do
      club = club_fixture()
      assert {:error, %Ecto.Changeset{}} = BookClubs.update_club(club, @invalid_attrs)
      assert club == BookClubs.get_club!(club.id)
    end

    test "delete_club/1 deletes the club" do
      club = club_fixture()
      assert {:ok, %Club{}} = BookClubs.delete_club(club)
      assert_raise Ecto.NoResultsError, fn -> BookClubs.get_club!(club.id) end
    end

    test "change_club/1 returns a club changeset" do
      club = club_fixture()
      assert %Ecto.Changeset{} = BookClubs.change_club(club)
    end
  end
end
