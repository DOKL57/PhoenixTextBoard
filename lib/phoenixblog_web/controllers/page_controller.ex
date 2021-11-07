defmodule PhoenixblogWeb.PageController do
  use PhoenixblogWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
