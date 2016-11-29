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
    |> put_data
    |> close_file
  end

  defp make_file({order, details}) do
    full_path =
      details["id"]
      |> file_name(order.wholesaler_code, order.project_code)
      |> file_path(details["wholesaler"], details["industry"])

    File.touch! full_path

    file = File.open! full_path, [:write]

    {file, order, details["id"]}
  end

  defp put_data({file, order, id}) do
    items = Map.to_list order.items

    content =
      id
      |> register(order, :one)
      |> register(items, :two)
      |> register(items, :three)

    IO.binwrite file, content

    {file, order}
  end

  defp close_file({file, order}) do
    File.close file

    {:ok, order}
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

  defp register(id, order, :one) do
    data_list = [1, order.pos_code, order.email, order.wholesaler_code,
                 order.term, order.condition_code, order.order_client,
                 id, order.markup]

    Enum.join(data_list, ";") <> "\r\n"
  end

  defp register(content, [], :two), do: content
  defp register(content, [{_, item } | tail], :two) do
    data_list = [2, item["ean"], item["amount"], item["discount"], item["net_price"]]

    new_content = content <> Enum.join(data_list, ";") <> "\r\n"

    register(new_content, tail, :two)
  end

  defp register(content, items, :three) do
    data_list = [9, Enum.count(items)]

    content <> Enum.join(data_list, ";") <> "\r\n"
  end
end
