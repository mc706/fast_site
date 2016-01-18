defmodule FastSite.QIPController do
  use FastSite.Web, :controller

  alias FastSite.QIP

  plug :scrub_params, "qip" when action in [:create, :update]

  def index(conn, _params) do
    qips = Repo.all(QIP)
    render(conn, "index.html", qips: qips)
  end

  def new(conn, _params) do
    changeset = QIP.changeset(%QIP{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"qip" => qip_params}) do
    changeset = QIP.changeset(%QIP{}, qip_params)

    case Repo.insert(changeset) do
      {:ok, _qip} ->
        conn
        |> put_flash(:info, "Qip created successfully.")
        |> redirect(to: qip_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    qip = Repo.get!(QIP, id)
    render(conn, "show.html", qip: qip)
  end

  def edit(conn, %{"id" => id}) do
    qip = Repo.get!(QIP, id)
    changeset = QIP.changeset(qip)
    render(conn, "edit.html", qip: qip, changeset: changeset)
  end

  def update(conn, %{"id" => id, "qip" => qip_params}) do
    qip = Repo.get!(QIP, id)
    changeset = QIP.changeset(qip, qip_params)

    case Repo.update(changeset) do
      {:ok, qip} ->
        conn
        |> put_flash(:info, "Qip updated successfully.")
        |> redirect(to: qip_path(conn, :show, qip))
      {:error, changeset} ->
        render(conn, "edit.html", qip: qip, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    qip = Repo.get!(QIP, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(qip)

    conn
    |> put_flash(:info, "Qip deleted successfully.")
    |> redirect(to: qip_path(conn, :index))
  end
end
