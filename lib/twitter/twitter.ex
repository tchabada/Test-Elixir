defmodule ChaboRest.Twitter do
  @moduledoc """
  Twitter
  """

  @default_selector "apple"

  def search(selector \\ @default_selector) do
    selector
    |> ExTwitter.search([count: 5])
    |> Enum.map(fn(tweet) -> tweet.text end)
    |> Enum.map(&ChaboRest.Persistence.insert/1)
  end

  def stream(selector \\ @default_selector) do
    [track: selector]
    |> ExTwitter.stream_filter
    |> Stream.map(fn(x) -> x.text end)
    |> Enum.map(&ChaboRest.Persistence.insert/1)
  end
end