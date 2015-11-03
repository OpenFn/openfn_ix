defmodule OpenfnIx.Receipt do
  use OpenfnIx.Web, :model

  @primary_key {:id, Ecto.UUID, [autogenerate: true]}
  @foreign_key_type Ecto.UUID

  schema "receipts" do
    field :body, :string
    belongs_to :inbox, Inbox
    timestamps
  end
end
