defmodule IrisWeb.PageController do
  use IrisWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
