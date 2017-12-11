defmodule PhoenixBlogWeb.PageController do
  use PhoenixBlogWeb, :controller

  alias PhoenixBlog.Repo
  alias PhoenixBlog.Post

  def index(conn, _params) do
    render conn, "index.html", posts: Repo.all(Post)
  end
end
