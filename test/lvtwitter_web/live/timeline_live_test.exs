defmodule LvtwitterWeb.TimelineLiveTest do
  use LvtwitterWeb.ConnCase

  import Phoenix.LiveViewTest

  setup :register_and_log_in_user

  test "user can visit home page", %{conn: conn} do
    {:ok, view, html} = live(conn, "/")

    assert html =~ "Home"
    assert render(view) =~ "Home"
  end

  test "current user can see own avatar", %{conn: conn, user: user} do

    {:ok, view, html} = live(conn, "/")

    assert render(view) =~ user.avatar_url

  end
end
