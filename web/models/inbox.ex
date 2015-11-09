defmodule OpenfnIx.Inbox do
  use OpenfnIx.Web, :model

  @primary_key {:id, Ecto.UUID, [autogenerate: true]}

  schema "inboxes" do
    field :title, :string
    field :autoprocess, :boolean, default: false
    timestamps
  end
end
