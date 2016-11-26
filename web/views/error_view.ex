defmodule EDI.ErrorView do
  use EDI.Web, :view

  def render("400.json", %{error: error}), do: err(%{detail: error, code: 400})
  def render("401.json", _), do: err(%{detail: "Unauthorized", code: 401})
  def render("403.json", _), do: err(%{detail: "Forbidden", code: 403})
  def render("404.json", _), do: err(%{detail: "Page not found", code: 404})
  def render("500.json", _), do: err(%{detail: "Internal server error", code: 500})

  def template_not_found(_, assigns), do: render("500.json", assigns)

  defp err(errors), do: %{errors: errors}
end
