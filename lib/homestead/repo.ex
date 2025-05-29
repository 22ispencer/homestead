defmodule Homestead.Repo do
  use Ecto.Repo,
    otp_app: :homestead,
    adapter: Ecto.Adapters.SQLite3
end
