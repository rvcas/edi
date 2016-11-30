Bureaucrat.start(
  paths: [
    {EDI.V1, "docs/v1/README.md"}
  ]
)

ExUnit.start(formatters: [ExUnit.CLIFormatter, Bureaucrat.Formatter])

Ecto.Adapters.SQL.Sandbox.mode(EDI.Repo, :manual)

