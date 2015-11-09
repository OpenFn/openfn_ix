defmodule OpenfnIx.AuthTestController do
  # This controller exists simply as a non-business endpoint to validate that auth is working
  use OpenfnIx.Web, :controller

  def pulse(conn, _params) do
    text(conn, "It's alive, Igor!")
  end
end
