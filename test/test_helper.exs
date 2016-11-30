Bureaucrat.start(
  paths: [
    {EDI, "docs/api/README.md"},
    {EDI.V1, "docs/api/v1/README.md"}
  ]
)

ExUnit.start(formatters: [ExUnit.CLIFormatter, Bureaucrat.Formatter])

Ecto.Adapters.SQL.Sandbox.mode(EDI.Repo, :manual)

