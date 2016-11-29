defmodule EDI.OrderView do
  use EDI.Web, :view

  alias EDI.OrderView

  def render("show.json", %{order: order}) do
    %{type: "Order",
      data: render_one(order, OrderView, "order.json")}
  end

  def render("order.json", %{order: order}) do
    %{project_code: order.project_code,
      pos_code: order.pos_code,
      email: order.email,
      wholesaler_code: order.wholesaler_code,
      term: order.term,
      condition_code: order.condition_code,
      order_client: order.order_client,
      markup: order.markup,
      items: order.items}
  end
end
