defmodule PhoenixBlogWeb.PostsController do
  use PhoenixBlogWeb, :controller

  alias PhoenixBlog.Repo
  alias PhoenixBlog.Post

  def index(conn, _params) do
    render conn, "index.html", posts: Repo.all(Post)
  end

  def new(conn, _params) do
    render conn, "new.html", post: Post.changeset(%Post{})
  end

  def create(conn, params) do

  end
end
