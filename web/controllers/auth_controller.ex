defmodule EDI.AuthController do
  use EDI.Web, :controller

  def create(conn, %{"data" => data}) do
    case authenticate(data) do
      { :ok, user } ->
        login(user)

      { :error, reason } ->
        conn
        |> put_status(:unprocessable_entity)
    end
  end

  defp authenticate(%{"email" = email, "password" => password}) do
    user = Repo.get_by(User, email: String.downcase(email))

    case check_password(user, password) do
      true  -> { :ok, user }
      _     -> { :error, "email or password does not match" }
    end
  end

  defp check_password(user, password) do
    case user do
      nil  -> false
      _    -> Comeonin.Bcrypt.checkpw(password, user.password_hash)
    end
  end
end
