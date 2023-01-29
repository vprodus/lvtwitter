defmodule Lvtwitter.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :body, :string, null: false
      add :likes_count, :integer, default: 0
      add :reposts_count, :integer, null: false, default: 0

      timestamps()
    end
  end
end
