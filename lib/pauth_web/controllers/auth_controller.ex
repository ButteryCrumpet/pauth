defmodule PauthWeb.AuthController do
  use PauthWeb, :controller
  
  alias Pauth.Auth
  alias Pauth.Auth.User
  
  def token(conn, %{"email" => email, "password" => password}) do
    case Auth.authenticate_user(email, password) do
      {:ok, user} ->
        render(conn, "token.json", data: Auth.get_token(user))
      {:error, message} ->
        render(conn, "error.json", data: message)
    end
  end
  
  def token(conn, _) do
    render(conn, "error.json", data: "email and password fields must be present")
  end
  
  defp set_refresh_token(%User{} = user) do
    
  end
  
  defp get_refresh_token do
    :crypto.strong_rand_bytes(16) |> Base.url_decode64 |> binary_part(0, 16)
  end
  
end
