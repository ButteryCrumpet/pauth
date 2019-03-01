defmodule PauthWeb.AuthView do
  use PauthWeb, :view
  
  def render("token.json", %{data: {:ok, token, _data}}) do
    %{token: token}
  end
  
  def render("token.json", %{data: {:err, message}}) do
    render("error.json", data: message)
  end
  
  def render("error.json", %{data: message}) do
    %{data: message}
  end
  
end
