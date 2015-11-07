defmodule OpenfnIx.AuthTestControllerTest do
  use OpenfnIx.ConnCase

  alias OpenfnIx.User

  setup do
    conn = conn() |> put_req_header("accept", "application/json") |> put_req_header("content-type", "application/json")
    {:ok, conn: conn}
  end

  # Note these tests are probably complete enough for now - but shoudl at some point be expanded
  # to cover aspects such as password reset, logout etc

  test "registration-confirmation-auth", %{conn: conn} do
    # Register user
    conn = post conn, users_path(conn, :create), %{"user" => %{"email" => "john@example.com", "password" => "secret"}}
    assert response(conn, 200)

    user = Repo.one!(from u in User, where: u.email == "john@example.com")

    {:ok, mail_contents} = File.read "/tmp/openfnix_mail"
    resp = Regex.run ~r{Your token is ([^"]+)"}, mail_contents
    token = List.last(resp)

    conn = post conn, users_path(conn, :confirm, user.id), %{"confirmation_token" => token}
    assert response(conn, 200)
    {:ok, %{"token" => auth_token}} = Poison.decode(conn.resp_body) 

    conn = conn() |> put_req_header("authorization", "Bearer #{auth_token}") |>
    put_req_header("accept", "application/json") |> put_req_header("content-type", "application/json")

    conn = get conn, auth_test_path(conn, :pulse)
    assert response(conn, 200)
  end
end
