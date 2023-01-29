defmodule LvtwitterWeb.PageControllerTest do
  use LvtwitterWeb.ConnCase

  setup :register_and_log_in_user

  test "GET /", %{conn: conn} do
    conn = get(conn, ~p"/")
    assert html_response(conn, 200) =~ "Home"
  end
end
