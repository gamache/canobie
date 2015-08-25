defmodule Canobie.PageController do
  use Canobie.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
