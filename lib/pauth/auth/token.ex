defmodule Pauth.Auth.Token do
  @moduledoc """
    Guardian JWT implementation module
  """
  use Guardian, otp_app: :pauth, token_ttl: {10, :minute}
  
  alias Pauth.Auth
  
  def subject_for_token(user, _claims) do
    {:ok, to_string(user.id)}
  end
  
  def resource_from_claims(%{"sub" => id}) do
    case Auth.get_user!(id) do
      nil -> {:error, :resource_not_found}
      user -> {:ok, user}
    end
  end
  
end
