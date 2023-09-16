defmodule Blog.Posts.PostList do
  alias Blog.Repo
  alias Blog.Post

  def all() do
    Repo.all(Post)
  end
end
