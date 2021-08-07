defmodule BookClubWeb.Authenticator do
  import Plug.Conn

  alias BookClub.Accounts

  def init(opts), do: opts

  def call(conn, _opts) do
    user =
      conn
      |> get_session(:user_id)
      |> case do
        nil -> nil
        id -> Accounts.get_user!(id)
      end

    assign(conn, :current_user, user)
  end
end
