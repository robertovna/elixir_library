defmodule GayaneLibrary.Changeset.Error do
  @moduledoc """
  Error module complements more info when an error occurred
  """
  @derive Jason.Encoder
  @enforce_keys [:code]
  defstruct [:code, :field, :details]

  def auth_error(reason) do
    %__MODULE__{code: "authentication", details: reason}
  end

  def login_error do
    %__MODULE__{code: "login_error", details: "Invalid email/nickname or password"}
  end
end
