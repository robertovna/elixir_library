defmodule GayaneLibrary.Accounts.Guardian.Pipeline do
  @moduledoc """
  This pipeline will look for tokens in either the session (it's ok if it's not loaded) followed by the header
  if one wasn't found in the session.

  We then ensure that we found a token and fail if not.

  Given that we found a token, we then attempt to load the resource the token refers to,
  failing if one is not found.
  """
  use Guardian.Plug.Pipeline,
    otp_app: :gayane_library,
    error_handler: GayaneLibrary.Accounts.Guardian.ErrorHandler,
    module: GayaneLibrary.Accounts.Services.Guardian

  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
  # Load the user if either of the verifications worked
  plug Guardian.Plug.LoadResource, allow_blank: true
end
