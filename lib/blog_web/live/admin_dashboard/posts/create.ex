defmodule BlogWeb.AdminDashboard.Posts.Create do
  require Logger
  alias Blog.BlogDashboard
  alias Blog.Post
  use BlogWeb, :live_view

  def render(assigns) do
    ~H"""
    <div>
    <%= live_patch "Back", to: Routes.live_path(@socket, BlogWeb.AdminDashboard.Home), class: "text-blue-500 hover:underline" %>
    </div>
    <.form let={f} for={@changeset} phx-change="validate" phx-submit="save" class="flex flex-col">
      <%= label f, :title %>
      <%= text_input f, :title %>
      <%= error_tag f, :title %>

      <%= label f, :seo_slug %>
      <%= text_input f, :seo_slug %>
      <%= error_tag f, :seo_slug %>

      <%= label f, :body %>
      <%= textarea f, :body %>
      <%= error_tag f, :body %>

      <%= label f, :published %>
      <%= checkbox f, :published %>
      <%= error_tag f, :published %>

      <%= submit "Save" %>
    </.form>
    """
  end

  def handle_event("validate", %{"post" => params}, socket) do
    changeset =
      %Post{}
      |> Post.changeset(params)
      |> Map.put(:action, :insert)

    {:noreply, assign(socket, changeset: changeset)}
  end

  def handle_event("save", %{"post" => params}, socket) do
    %{assigns: %{admin_id: admin_id}} = socket

    case BlogDashboard.create_post(Map.put(params, "user_id", admin_id)) do
      {:ok, _} ->
        {:noreply,
         socket
         |> put_flash(:info, "post created")}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

  def mount(_params, session, socket) do
    admin = BlogDashboard.get_admin_by_session_token(session["admin_token"])
    changeset = Post.changeset(%Post{}, %{})
    {:ok, socket |> assign(changeset: changeset, admin_id: Integer.to_string(admin.id))}
  end
end
