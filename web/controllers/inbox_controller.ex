defmodule OpenfnIx.InboxController do
  use OpenfnIx.Web, :controller

  alias OpenfnIx.Inbox
  alias OpenfnIx.Receipt

  def receive(conn, %{"id" => id}) do
    inbox = Repo.get(Inbox, id)
    Repo.insert(%Receipt{inbox_id: id, body: conn.private[:raw_body]})
    text(conn, "")
  end
end
