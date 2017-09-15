defmodule ChaboRest.Repo.Migrations.CreateTweets do
  use Ecto.Migration

  def change do
    create table(:tweet, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :msg, :text
    end
  end
end
