defmodule EDI.ConnCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      # Import conveniences for testing with connections
      use Phoenix.ConnTest

      alias EDI.Repo
      import Ecto
      import Ecto.Changeset
      import Ecto.Query

      import EDI.Router.Helpers
      import Bureaucrat.Helpers
      import EDI.Factory

      # The default endpoint for testing
      @endpoint EDI.Endpoint
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(EDI.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(EDI.Repo, {:shared, self()})
    end

    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end
end
