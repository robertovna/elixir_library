defmodule GayaneLibrary.Factories do
  @moduledoc """
  Defines the factories for ExMachina
  """
  use ExMachina.Ecto, repo: GayaneLibrary.Repo

  use GayaneLibrary.Factories.Accounts.{
    UserFactory
  }
end
