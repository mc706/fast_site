defmodule FastSite.QIPControllerTest do
  use FastSite.ConnCase

  alias FastSite.QIP
  @valid_attrs %{date: "2010-04-17 14:00:00", description: "some content", number: 42, resolution: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, qip_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing qips"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, qip_path(conn, :new)
    assert html_response(conn, 200) =~ "New qip"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, qip_path(conn, :create), qip: @valid_attrs
    assert redirected_to(conn) == qip_path(conn, :index)
    assert Repo.get_by(QIP, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, qip_path(conn, :create), qip: @invalid_attrs
    assert html_response(conn, 200) =~ "New qip"
  end

  test "shows chosen resource", %{conn: conn} do
    qip = Repo.insert! %QIP{}
    conn = get conn, qip_path(conn, :show, qip)
    assert html_response(conn, 200) =~ "Show qip"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, qip_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    qip = Repo.insert! %QIP{}
    conn = get conn, qip_path(conn, :edit, qip)
    assert html_response(conn, 200) =~ "Edit qip"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    qip = Repo.insert! %QIP{}
    conn = put conn, qip_path(conn, :update, qip), qip: @valid_attrs
    assert redirected_to(conn) == qip_path(conn, :show, qip)
    assert Repo.get_by(QIP, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    qip = Repo.insert! %QIP{}
    conn = put conn, qip_path(conn, :update, qip), qip: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit qip"
  end

  test "deletes chosen resource", %{conn: conn} do
    qip = Repo.insert! %QIP{}
    conn = delete conn, qip_path(conn, :delete, qip)
    assert redirected_to(conn) == qip_path(conn, :index)
    refute Repo.get(QIP, qip.id)
  end
end
