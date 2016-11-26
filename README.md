# EDI

I have a habit of keeping a `docker-compose.yml` in the repo
to avoid having to install and configure postgres from scratch.
If you do not/cannot use docker, skip the first step, then just install and configure
postgres normally.

  * Start Postgres: `docker-compose up -d`
  * Install dependencies with: `mix deps.get`
  * Create and migrate the database with: `mix ecto.create && mix ecto.migrate` (bonus: use an alias from `mix.exs`)
  * Start Phoenix endpoint with `mix phoenix.server`

Now the endpoint (server) will be listening for requests at [`localhost:4000`](http://localhost:4000).

## Testing
Elixir comes with [ExUnit](http://elixir-lang.org/docs/stable/ex_unit/ExUnit.html)
and phoenix provides some test helpers. Similar to rspec, the `tests` folder normally 
mimics the directory structure of your app and contains files of the same name with `_test.exs`
appended to the end: `file_name_test.exs`.

*Note: `.exs` vs. `.ex` (left is usually for scripting)

I have added some things to make testing a little cooler:

  * [Bureaucrat](https://github.com/api-hogs/bureaucrat) (for autogenerating api-docs from tests)
  * [ExMachina](https://github.com/thoughtbot/ex_machina) (easily create test data, kinda like factory girl)
  * [Faker](https://github.com/igas/faker) (generate fake data, pairs nice with exmachne)
  * [credo](https://github.com/rrrene/credo) (linting/code analysis, look at `.credo.exs`)
  * [mix_test.watch](https://github.com/lpil/mix-test.watch) (watchs files while testing, configured to run credo as well)
    * try this out with: `mix test.watch` (tests run and then credo runs, every file save)
    
## BEAM
To much to explain in a little readme to I took some screenshots
of the observer app that ships with erlang.

This is the application tree:

![app process tree](https://github.com/lrosa007/edi/raw/master/docs/screenshots/app-process-tree.png "Application Process Tree")

These are some load charts:

![load charts](https://github.com/lrosa007/edi/raw/master/docs/screenshots/load-charts.png "Load Charts")

This is just some system info:

![system info](https;//github.com/lrosa007/edi/raw/master/docs/screenshots/system-info.png "System Info")

