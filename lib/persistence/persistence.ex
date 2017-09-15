defmodule ChaboRest.Persistence do
  @moduledoc """
  Persistence layer
  """

  require Logger

  def insert(text) do
    ChaboRest.Repo.insert(%ChaboRest.Tweet{msg: text})
  end
end
