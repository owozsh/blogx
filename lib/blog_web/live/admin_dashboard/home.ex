defmodule BlogWeb.AdminDashboard.Home do
  use BlogWeb, :live_view

  def render(assigns) do
    ~H"""
      <a href="/">Back</a>
      <h1 class="mb-3 font-xl font-bold text-center">Admin Dashboard</h1>
      <%= live_patch "Create Post", to: Routes.live_path(@socket, BlogWeb.AdminDashboard.Posts.Create), class: "text-center bg-blue-500 py-2 px-4 text-white w-36" %>
      <div class="flex flex-col gap-3">
        <%= for post <- @posts do %>
          <div class="p-3 border border-solid border-stone-200 flex items-center justify-between">
              <h5 class="text-lg font-bold"><%= post.title %></h5>
              <div class="flex gap-3">
                <a class="hover:underline text-blue-500 px-2" href="#" >View</a>
                <a class="hover:underline text-blue-500 px-2" href="#" >Edit</a>
                <a class="hover:underline text-red-500 px-2" href="#" >Delete</a>
              </div>
          </div>
        <% end %>
      </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :posts, Blog.Posts.PostList.all())}
  end
end
