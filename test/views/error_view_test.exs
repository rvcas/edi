defmodule EDI.ErrorViewTest do
  use EDI.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  alias EDI.{ErrorView}

  test "renders 400.json" do
    assert render(ErrorView, "400.json", error: "anything") ==
      %{:errors => %{code: 400, detail: "anything"}}
  end

  test "renders 401.json" do
    assert render(ErrorView, "401.json", []) ==
      %{:errors => %{code: 401, detail: "Unauthorized"}}
  end

  test "renders 403.json" do
    assert render(ErrorView, "403.json", []) ==
      %{:errors => %{code: 403, detail: "Forbidden"}}
  end

  test "renders 404.json" do
    assert render(ErrorView, "404.json", []) ==
      %{:errors => %{code: 404, detail: "Page not found"}}
  end

  test "render 500.json" do
    assert render(ErrorView, "500.json", []) ==
      %{:errors => %{code: 500, detail: "Internal server error"}}
  end

  test "template not found" do
    assert render(ErrorView, "505.json", []) ==
      %{:errors => %{code: 500, detail: "Internal server error"}}
  end
end
