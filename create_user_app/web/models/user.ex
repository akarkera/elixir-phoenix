defmodule Dubber.User do
  use Dubber.Web, :model

  schema "users" do
    field :account, :string
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :language, :string
    field :role, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:account, :email, :first_name, :last_name, :language, :role])
    |> validate_required([:account, :email, :first_name, :last_name, :language, :role])
    |> validate_format(:email, ~r/@/)
  end
end
