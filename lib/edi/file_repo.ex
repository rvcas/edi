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
    {order, details}
    |> make_file
    |> open_file
    |> write_file
    |> close_file

    {:ok, order}
  end

  defp make_file({order, detail}) do
    full_path =
      detail.id
      |> file_name(order.wholesaler_code, order.project_code)
      |> file_path(detail.wholesaler, detail.industry)

    File.touch! full_path

    {full_path, order, detail}
  end

  defp file_name(id, wholesaler_code, project_code) do
    ['PEDIDO', pad_zero(id), pad_zero(wholesaler_code), project_code]
    |> Enum.join("_")
    |> Kernel.<>(".PED.#{:rand.uniform(99999)}")
  end

  defp file_path(name, wholesaler, industry) do
    [@directories.main, industry, @directories.prefix, wholesaler, @directories.order, name]
    |> Path.join
  end

  defp pad_zero(str) do
    String.pad_leading(str, 14, "0")
  end
end
