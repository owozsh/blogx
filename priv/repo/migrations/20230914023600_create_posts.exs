defmodule Blog.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :body, :text
      add :published, :boolean, default: false, null: false
      add :user_id, :integer
      add :seo_slug, :string

      timestamps()
    end
  end
end
