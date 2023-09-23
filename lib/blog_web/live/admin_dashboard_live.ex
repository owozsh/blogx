defmodule BlogWeb.AdminDashboardLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h1>Admin Dashboard</h1>
          <%= for post <- @posts do %>
            <div class="card">
              <div class="card-body">
                <h5 class="card-title"><%= post.title %></h5>
                <p class="card-text"><%= post.body %></p>
                <a href="#" class="btn btn-primary">Edit</a>
                <a href="#" class="btn btn-danger">Delete</a>
              </div>
            </div>
          <% end %>
        </div>
      </div>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, posts: Blog.Posts.PostList.all())}
  end
end
