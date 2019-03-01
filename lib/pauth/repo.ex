defmodule Pauth.Repo do
  use Ecto.Repo,
    otp_app: :pauth,
    adapter: Ecto.Adapters.MySQL
end
