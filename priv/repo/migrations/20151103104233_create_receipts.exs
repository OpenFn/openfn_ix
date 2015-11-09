defmodule OpenfnIx.Repo.Migrations.CreateReceipts do
  use Ecto.Migration

  def change do
    create table(:receipts, primary_key: false) do
      add :id, :uuid, primary_key: true, default: fragment("gen_random_uuid()")
      add :body, :text, null: false
      add :inbox_id, references(:inboxes, type: :uuid), null: false
      timestamps
    end
    create index(:receipts, [:inbox_id])
  end
end
