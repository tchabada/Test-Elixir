defmodule ChaboRest do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec

    # Define workers and child supervisors to be supervised
    children = [
      # Start the Ecto repository
      supervisor(ChaboRest.Repo, []),
      # Start the endpoint when the application starts
      supervisor(ChaboRest.Endpoint, []),
      # Start your own worker by calling: ChaboRest.Worker.start_link(arg1, arg2, arg3)
      # worker(ChaboRest.Worker, [arg1, arg2, arg3]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ChaboRest.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ChaboRest.Endpoint.config_change(changed, removed)
    :ok
  end

  def twitter_test do
    ExTwitter.search("elixir-lang", [count: 5])
      |> Enum.map(fn(tweet) -> tweet.text end)
      |> Enum.map(fn(text) -> ChaboRest.Repo.insert(%ChaboRest.Tweet{msg: text}) end)
  end

  def twitter_stream(selector \\ "apple") do
    stream = ExTwitter.stream_filter(track: selector)
      |> Stream.map(fn(x) -> x.text end)
      |> Enum.map(fn(text) -> ChaboRest.Repo.insert(%ChaboRest.Tweet{msg: text}) end)
  end
end
