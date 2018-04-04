defmodule Dubber.PageController do
  use Dubber.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
