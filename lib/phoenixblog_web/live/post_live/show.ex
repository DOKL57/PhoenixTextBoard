defmodule PhoenixblogWeb.PostLive.Show do
  use PhoenixblogWeb, :live_view

  alias Phoenixblog.Blog
  alias Phoenixblog.Blog.Comment
  alias Phoenixblog.Blog.Post
  alias Phoenixblog.Repo

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    changeset = Blog.change_comment(%Comment{})
    list_comments = Blog.list_comments(id)

    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:post, Blog.get_post_with_tags!(id))
     |> assign(:changeset, changeset)
     |> assign(:id, id)
     |> assign(:comments_list, list_comments)}
  end

  """

  @impl true
  def handle_event(event, params, socket) do
    IO.inspect({event, params}, label: "Got unknown event")
    {:noreply, socket}
  end
  """

  @impl true
  def handle_event("validate_comment", %{"post" => comment_params}, socket) do
    changeset =
      %Comment{}
      |> Comment.changeset(comment_params)
      |> Map.put(:action, :validate)

    {:noreply,
     socket
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate_comment", %{"comment" => comment_params}, socket) do
    changeset =
      %Comment{}
      |> Comment.changeset(comment_params)
      |> Map.put(:action, :validate)

    {:noreply,
     socket
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("save", %{"post" => comment_params}, socket) do
    # добавить сюда нормальное сохранение
    # потом лист комментов и выводить его в темплейт
    com =
      %Comment{
        body: Map.get(comment_params, "body"),
        name: Map.get(comment_params, "name"),
        post_id: socket.assigns.id
      }
      |> Comment.changeset(comment_params)

    socket.assigns.post
    |> Ecto.Changeset.change()
    |> Ecto.Changeset.put_assoc(:comments, [com | socket.assigns.post.comments])
    |> Repo.update()

    socket
    |> put_flash(:info, "Comment created successfully.")

    {:noreply, assign(socket, changeset: socket.assigns.changeset)}
  end

  @impl true
  def handle_event("save", %{"comment" => comment_params}, socket) do
    # добавить сюда нормальное сохранение
    # потом лист комментов и выводить его в темплейт
    com =
      %Comment{
        body: Map.get(comment_params, "body"),
        name: Map.get(comment_params, "name"),
        post_id: socket.assigns.id
      }
      |> Comment.changeset(comment_params)

    socket.assigns.post
    |> Ecto.Changeset.change()
    |> Ecto.Changeset.put_assoc(:comments, [com | socket.assigns.post.comments])
    |> Repo.update()

    socket
    |> put_flash(:info, "Comment created successfully.")

    {:noreply, assign(socket, changeset: socket.assigns.changeset)}
  end

  defp page_title(:show), do: "Show Post"
end
