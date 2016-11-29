defmodule EDI.FileRepo do
  import Ecto.Changeset, only: [apply_changes: 1]

  @directories Application.get_env :edi, :directories

  def insert({changeset, details}) do
    case changeset.valid? do
      true ->
        if missing_details?(details),
          do: {:error, "missing info"},
          else: apply_changes(changeset) |> do_insert(details)
      _ -> {:error, changeset}
    end
  end

  defp missing_details?(%{"industry" => _, "wholesaler" => _,
                          "id" => _, "layout" => _}),
    do: false

  defp missing_details?(_),
    do: true

  defp do_insert(order, details) do
    
  end
end
