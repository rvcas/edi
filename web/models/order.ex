defmodule EDI.Order do
  use EDI.Web, :model

  @allowed [:project_code, :pos_code, :email,
            :wholesaler_code, :term, :condition_code,
            :order_client, :markup, :items]

  schema "orders" do
    field :project_code, :string
    field :pos_code, :string
    field :email, :string
    field :wholesaler_code, :string
    field :term, :string
    field :condition_code, :string
    field :order_client, :string
    field :markup, :string
    field :items, :map
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @allowed)
    |> validate_required(@allowed)
    |> validate_length(:email, min: 1, max: 255)
    |> validate_format(:email, ~r/@/)
  end
end
