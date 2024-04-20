defmodule Blog.DateUtils do
  def full(date) do
    Calendar.strftime(date, "%Y-%m-%d %I:%M:%S %p")
  end
end
