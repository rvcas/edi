defmodule EDI.AuthController do
  use EDI.Web, :controller

  alias EDI.{AuthController, ErrorView, User, UserView}

  plug Guardian.Plug.EnsureAuthenticated, [handler: AuthController] when action in [:delete, :show]

  def create(conn, %{"data" => data}) do
    result =
      with {:ok, user} <- user_from_auth(data),
           :ok <- validate_pass(user, data),
           do: login(conn, user)

    case result do
      {:ok, user, token} ->
        conn
        |> put_status(:created)
        |> render(UserView, "show.json", user: user, token: token)

      {:error, error} ->
        conn
        |> put_status(:bad_request)
        |> render(ErrorView, "400.json", error: error)
    end
  end

  def show(conn, _) do
    user = Guardian.Plug.current_resource(conn)
    render(conn, UserView, "show.json", user: user)
  end

  def delete(conn, _) do
    conn
    |> Guardian.Plug.current_token
    |> Guardian.revoke!
    |> send_resp(:no_content, "")
  end

  def unauthenticated(conn, _) do
    conn
    |> put_status(:unauthorized)
    |> render(ErrorView, "401.json")
  end

  def unauthorized(conn, _params) do
    conn
    |> put_status(:forbidden)
    |> render(ErrowView, "403.json")
  end

  defp user_from_auth(%{"email" => email}) do
    user = Repo.get_by(User, email: email)

    case user do
      nil  -> {:error, "invalid email"}
      _    -> {:ok, user}
    end
  end

  defp user_from_auth(_), do: {:error, "email required"}

  defp validate_pass(user, %{"password" => password}) do
    if Comeonin.Bcrypt.checkpw(password, user.password_hash),
      do: :ok,
      else: {:error, "invalid password"}
  end

  defp validate_pass(_, _), do: {:error, "password required"}

  defp login(conn, user) do
    token =
      conn
      |> Guardian.Plug.api_sign_in(user)
      |> Guardian.Plug.current_token

    {:ok, user, token}
  end
end
