defmodule ChaboRest.Tweet do
  use Ecto.Schema

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "tweet" do
    field :msg, :string
  end
end
