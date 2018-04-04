defmodule Dubber.PageControllerTest do
  use Dubber.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Create User"
  end


  test "GET /user", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Create User"
  end
end
