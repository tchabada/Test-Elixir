defmodule ChaboRest.PageController do
  use ChaboRest.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def tweets(conn, _params) do
  end

end
