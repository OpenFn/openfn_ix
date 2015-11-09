defmodule OpenfnIx.Repo.Migrations.CreateInboxes do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION IF NOT EXISTS pgcrypto"

    create table(:inboxes, primary_key: false) do
      add :id, :uuid, primary_key: true, default: fragment("gen_random_uuid()")
      add :title, :string, null: false
      add :autoprocess, :boolean, default: false, null: false
      timestamps
    end
  end
end
