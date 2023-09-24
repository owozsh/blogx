defmodule Blog.Posts.PostList do
  alias Blog.Repo
  alias Blog.Post

  import Ecto.Query, only: [from: 2]

  def all() do
    Repo.all(Post)
  end

  def all_published() do
    Repo.all(from p in Post, where: p.published)
  end
end
