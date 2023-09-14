defmodule BlogWeb.AdminSessionController do
  use BlogWeb, :controller

  alias Blog.BlogDashboard
  alias BlogWeb.AdminAuth

  def new(conn, _params) do
    render(conn, "new.html", error_message: nil)
  end

  def create(conn, %{"admin" => admin_params}) do
    %{"email" => email, "password" => password} = admin_params

    if admin = BlogDashboard.get_admin_by_email_and_password(email, password) do
      AdminAuth.log_in_admin(conn, admin, admin_params)
    else
      # In order to prevent user enumeration attacks, don't disclose whether the email is registered.
      render(conn, "new.html", error_message: "Invalid email or password")
    end
  end

  def delete(conn, _params) do
    conn
    |> put_flash(:info, "Logged out successfully.")
    |> AdminAuth.log_out_admin()
  end
end
