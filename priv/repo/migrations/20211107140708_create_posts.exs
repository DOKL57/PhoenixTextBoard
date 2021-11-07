defmodule Phoenixblog.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :body, :string
      add :title, :string

      timestamps()
    end
  end
end
