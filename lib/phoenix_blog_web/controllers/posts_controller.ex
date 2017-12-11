defmodule PhoenixBlogWeb.PostsController do
  use PhoenixBlogWeb, :controller

  alias PhoenixBlog.Repo
  alias PhoenixBlog.Post

  def index(conn, _params) do
    render conn, "index.html", posts: Repo.all(Post)
  end

  # def new(conn, _params) do
  #   changeset = Foo.changeset(%Foo{})
  #   render(conn, "new.html", changeset: changeset)
  # end

  def new(conn, _params) do
    render conn, "new.html", post: Post.changeset(%Post{})
  end

  # def create(conn, %{"foo" => foo_params}) do
  #   changeset = Foo.changeset(%Foo{}, foo_params)

  #   case Repo.insert(changeset) do
  #     {:ok, foo} ->
  #       conn
  #       |> put_flash(:info, "Foo created successfully.")
  #       |> redirect(to: foo_path(conn, :show, foo))
  #     {:error, changeset} ->
  #       render(conn, "new.html", changeset: changeset)
  #   end
  # end

  def create(conn, %{"post" => user_params}) do
    changeset = Post.changeset(%Post{}, user_params)

    case Repo.insert(changeset) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post successfully created")
        |> redirect(to: posts_path(conn, :index))
      {:error, post} ->
        conn
        |> put_flash(:error, "Title or Body missing")
        |> render("new.html", post: post)
    end
  end

  # def show(conn, %{"id" => id}) do
  #   foo = Repo.get!(Foo, id)
  #   render(conn, "show.html", foo: foo)
  # end

  # def edit(conn, %{"id" => id}) do
  #   foo = Repo.get!(Foo, id)
  #   changeset = Foo.changeset(foo)
  #   render(conn, "edit.html", foo: foo, changeset: changeset)
  # end

  # def update(conn, %{"id" => id, "foo" => foo_params}) do
  #   foo = Repo.get!(Foo, id)
  #   changeset = Foo.changeset(foo, foo_params)

  #   case Repo.update(changeset) do
  #     {:ok, foo} ->
  #       conn
  #       |> put_flash(:info, "Foo updated successfully.")
  #       |> redirect(to: foo_path(conn, :show, foo))
  #     {:error, changeset} ->
  #       render(conn, "edit.html", foo: foo, changeset: changeset)
  #   end
  # end

  # def delete(conn, %{"id" => id}) do
  #   foo = Repo.get!(Foo, id)

  #   # Here we use delete! (with a bang) because we expect
  #   # it to always work (and if it does not, it will raise).
  #   Repo.delete!(foo)

  #   conn
  #   |> put_flash(:info, "Foo deleted successfully.")
  #   |> redirect(to: foo_path(conn, :index))
  # end
end
