defmodule EDI.V1.UserController do
  use EDI.Web, :controller

  alias EDI.{ AuthController, ChangesetView, User, UserView }

  plug Guardian.Plug.EnsureAuthenticated, [handler: AuthController] when action in [:delete, :update]

  def create(conn, %{"data" => data}) do
    changeset = User.registration_changeset(%User{}, data)

    case Repo.insert(changeset) do
      {:ok, user} ->
        {:ok, token, _claims} = Guardian.encode_and_sign(user, :token)

        conn
        |> put_status(:created)
        |> render(UserView, "show.json", user: user, token: token)

      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ChangesetView, "error.json", changeset: changeset)
    end
  end

  def update(conn, %{"id" => id, "data" => data}) do
    user = Repo.get!(User, id)
    changeset = User.changeset(user, data)

    case Repo.update(changeset) do
      {:ok, user} ->
        render conn, "show.json", user: user
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Shepherd.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Repo.get!(User, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(user)

    send_resp(conn, :no_content, "")
  end
end
