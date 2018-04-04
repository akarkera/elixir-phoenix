defmodule Dubber.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :account, :string
      add :email, :string
      add :first_name, :string
      add :last_name, :string
      add :language, :string
      add :role, :string

      timestamps()
    end

  end
end
