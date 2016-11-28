defmodule EDI.FileRepo do
  @directories Application.get_env :edi, :directories

  def print_dirs do
    @directories.main
  end
end
