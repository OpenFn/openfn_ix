defmodule OpenfnIx.Endpoint do
  use Phoenix.Endpoint, otp_app: :openfn_ix

  socket "/socket", OpenfnIx.UserSocket

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phoenix.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/", from: :openfn_ix, gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Logger

  # Fishing out the body - as per this solution https://github.com/phoenixframework/phoenix/issues/459
  # If this works - need to see if we can restrict this to certain routes - but that feels like an encapsulation fail?

  defp copy_req_body(conn, _) do
    {:ok, body, _} = Plug.Conn.read_body(conn)
    Plug.Conn.put_private(conn, :raw_body, body)
  end

  plug :copy_req_body
  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_openfn_ix_key",
    signing_salt: "2obCQFJN"

  plug OpenfnIx.Router
end
