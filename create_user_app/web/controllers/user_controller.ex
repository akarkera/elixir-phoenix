defmodule Dubber.UserController do
  use Dubber.Web, :controller
  alias Dubber.User

  def index(conn, _params) do
    changeset = User.changeset(%User{})
    users = Repo.all(User)
    render(conn, "index.html", changeset: changeset, users: users)
  end

  def create(conn, %{"user"=> %{"account" => account, "role" => role, "email" => email, "first_name" => first_name, "last_name" => last_name, "language" =>language}}) do
    changeset = User.changeset(%User{},%{"account" => account, "role" => role, "email" => email, "first_name" => first_name, "last_name" => last_name, "language" =>language})
    case Repo.insert(changeset) do
        {:error, changeset} ->
          conn
          |> render("index.html", changeset: changeset)
        {:ok, _} ->
          case Userapi.create_user(account, role, email, first_name, last_name, language) do
            {:ok, %HTTPoison.Response{status_code: 201}} ->
              on_success(conn)
            {:ok, %HTTPoison.Response{status_code: 404, body: body}} ->
              body = Poison.decode!(body)
              on_failure(conn, body["message"], changeset)
            {:ok, %HTTPoison.Response{status_code: 400, body: body}} ->
              body = Poison.decode!(body)
              [head |_] = body["details"]
              on_failure(conn, "#{body["message"]}-  #{head["message"]}:  #{head["details"]}", changeset)
            _ ->
            on_failure(conn, "Error", changeset)
          end
      end
  end

  def on_success(conn) do
    conn
    |> put_flash(:info, "Sucessfully created User")
    |> redirect(to: user_path(conn, :index))
  end

  def on_failure(conn, message, changeset) do
  conn
  |> put_flash(:error, message)
  |> render("index.html", changeset: changeset)
  end
end
