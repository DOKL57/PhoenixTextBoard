defmodule Phoenixblog.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset


  schema "posts" do
    field :body, :string
    field :title, :string

    many_to_many :tags, Phoenixblog.Blog.Tag, join_through: "posts_tags", on_replace: :delete
    has_many :comments, Phoenixblog.Blog.Comment
    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:body, :title])
    |> validate_required([:body, :title])
  end
end
