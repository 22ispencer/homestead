defmodule Homestead.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :given_name, :string
    field :family_name, :string
    field :email, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:given_name, :family_name, :email])
    |> validate_required([:given_name, :family_name, :email])
  end
end
