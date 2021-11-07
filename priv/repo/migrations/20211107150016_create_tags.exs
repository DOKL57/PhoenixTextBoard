defmodule Phoenixblog.Repo.Migrations.CreateTags do
  use Ecto.Migration

  def change do
    create table(:tags) do
      add(:name, :string, null: false)

      timestamps()
    end

    execute "TRUNCATE tags CASCADE"
    create(index("tags", [:name], unique: true))
  end
end
