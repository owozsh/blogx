defmodule Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :title, :string
    field :body, :string
    field :published, :boolean, default: false
    field :user_id, :integer
    field :seo_slug, :string

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body, :published, :user_id, :seo_slug])
    |> validate_required([:title, :body, :published, :user_id, :seo_slug])
  end
end
