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
    # Register user
    inbox = Repo.insert! %Inbox{title: "My Little Inbox"}
    conn = post conn, inbox_path(conn, :receive, inbox), "{\"hello\":false}"
    assert response(conn, 200)
    receipt_body = Repo.one(from r in Receipt, where: r.inbox_id == ^inbox.id, select: r.body)
    assert receipt_body == "{\"hello\":false}"
  end

  test "placeholder authentication test", %{conn: conn} do
    # This needs to live somewhere else
    # Register user
    # conn = post conn, users_path(conn, :create), %{"user" => %{"email" => "john@example.com", "password" => "secret"}}
    # assert response(conn, 200)

    # user = Repo.one!(from u in User, where: u.email == "john@example.com")

    # {:ok, mail_contents} = File.read "/tmp/openfnix_mail"
    # resp = Regex.run ~r{Your token is ([^"]+)"}, mail_contents
    # token = List.last(resp)

    # conn = post conn, users_path(conn, :confirm, user.id), %{"confirmation_token" => token}
    # assert response(conn, 200)
    # inbox = Repo.insert! %Inbox{title: "My Little Inbox"}
    # conn = post conn, inbox_path(conn, :receive, inbox), "{\"hello\":false}"
    # assert response(conn, 200)
    # receipt_body = Repo.one(from r in Receipt, where: r.inbox_id == ^inbox.id, select: r.body)
    # assert receipt_body == "{\"hello\":false}"
  end
end
