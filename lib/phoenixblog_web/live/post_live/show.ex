defmodule PhoenixblogWeb.PostLive.Show do
  use PhoenixblogWeb, :live_view

  alias Phoenixblog.Blog
  alias Phoenixblog.Blog.Comment

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    changeset = Blog.change_comment(%Comment{})

    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:post, Blog.get_post_with_tags!(id))
     |> assign(:changeset, changeset)}
  end

  """
  @impl true
  def handle_event(event, params, socket) do
    IO.inspect({event, params}, label: "Got unknown event")
    {:noreply, socket}
  end
"""
  @impl true
  def handle_event("validate", %{"comment" => comment_params}, socket) do
    changeset = Blog.change_comment(%Comment{})

    {:noreply, assign(socket, :changeset, changeset)}
  end

  @impl true
  def handle_event("save", %{"comment" => comment_params}, socket) do
    #добавить сюда нормальное сохранение
    case Blog.add_comment(socket.assigns.post, comment_params) do
      {:ok, _post} ->
        {:noreply,
         socket
         |> put_flash(:info, "Comment_added")}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
       end
      end

  defp page_title(:show), do: "Show Post"
end
