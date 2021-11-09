defmodule PhoenixblogWeb.PostLive.Tag do
  use PhoenixblogWeb, :live_view

  alias Phoenixblog.Blog
  alias Phoenixblog.Repo
  alias Phoenixblog.Blog.Post

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"tag" => tag}, _, socket) do
    post_without_tags = Blog.list_posts() |> Repo.preload(:tags)

    posts_ids = []

    posts_ids =
      for post <- post_without_tags do
        for post_tag <- post.tags do
          if(post_tag.name == tag) do
            [post.id | posts_ids]
          end
        end
      end
      |> List.flatten()
      |> Enum.reject(&is_nil/1)
      posts = []

      posts = Enum.map(posts_ids, fn x -> [Repo.get(Post, x) | posts] end) |> List.flatten() |> Repo.preload(:tags)

    {:noreply,
     socket
     |> assign(:tag, tag)
    |> assign(:posts, posts)}
  end
end
