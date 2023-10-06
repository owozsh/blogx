defmodule BlogWeb.AdminDashboard.Posts.Create do
  use BlogWeb, :live_view

  def render(assigns) do
    ~H"""
    <div>
    <%= live_patch "Back", to: Routes.live_path(@socket, BlogWeb.AdminDashboard.Home), class: "text-blue-500 hover:underline" %>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
