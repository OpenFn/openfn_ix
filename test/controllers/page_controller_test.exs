defmodule OpenfnIx.PageControllerTest do
  use OpenfnIx.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "Welcome to Open Function's UTP."
  end
end
