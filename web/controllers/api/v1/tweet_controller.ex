defmodule ChaboRest.API.V1.TweetController do
  use ChaboRest.Web, :controller

  require Ecto.Query
  require Logger

  alias Ecto.Query
  alias ChaboRest.Repo
  alias ChaboRest.Tweet

  def index(conn, _params) do
    query = Query.from t in Tweet, select: t.msg, limit: 10
    res = Repo.all(query)

    json(conn, res)
  end
end
