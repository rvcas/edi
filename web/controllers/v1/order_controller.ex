defmodule EDI.V1.OrderController do
  use EDI.Web, :controller

  alias EDI.{AuthController, ChangesetView, FileRepo, Order, OrderView}

  plug Guardian.Plug.EnsureAuthenticated, [handler: AuthController] when action in [:create]

  def create(conn, data, details) do
    changeset = Order.changeset(%Order{}, data)

    case FileRepo.insert({changeset, details}) do
      {:ok, order} ->
        conn
        |> put_status(:created)
        |> render(OrderView, "show.json", order: order)
      {:error, "missing info" = msg} ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(%{error: msg})
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ChangesetView, "error.json", changeset: changeset)
    end
  end

  def action(conn, _) do
    apply(__MODULE__, action_name(conn),
      [conn, conn.params["order"] || %{}, Map.drop(conn.params, ["order"])])
  end
end
