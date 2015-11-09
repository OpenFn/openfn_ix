defmodule OpenfnIx.InboxControllerTest do
  use OpenfnIx.ConnCase

  alias OpenfnIx.Inbox
  alias OpenfnIx.Receipt
  alias OpenfnIx.User

  setup do
    conn = conn() |> put_req_header("accept", "application/json") |> put_req_header("content-type", "application/json")
    {:ok, conn: conn}
  end

  test "creates a receipt for data sent to an inbox", %{conn: conn} do
    inbox = Repo.insert! %Inbox{title: "My Little Inbox"}
    conn = post conn, inbox_path(conn, :receive, inbox), "{\"hello\":false}"
    assert response(conn, 200)
    receipt_body = Repo.one(from r in Receipt, where: r.inbox_id == ^inbox.id, select: r.body)
    assert receipt_body == "{\"hello\":false}"
  end
end
