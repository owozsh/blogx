defmodule BlogWeb.PostController do
  use BlogWeb, :controller

  def index(conn, _params) do
    posts = Blog.Posts.PostList.all()

    conn
    |> render("posts.html", posts: posts)
  end
end
