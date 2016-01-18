defmodule FastSite.RegistrationController do
    use FastSite.Web, :controller

    alias FastSite.User

    def new(conn, _params) do
        changeset = User.changeset(%User{})
        render conn, changeset: changeset
    end

    def create(conn, %{"user" => user_params}) do
        changeset = User.changeset(%User{}, user_params)

        case FastSite.Registration.create(changeset, FastSite.Repo) do
            {:ok, changeset} ->

            {:error, changeset} ->


        end
    end

end
