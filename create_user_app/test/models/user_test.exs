defmodule Dubber.UserTest do
  use Dubber.ModelCase

  alias Dubber.User

  @valid_attrs %{account: "some content", email: "someemail@test.com", first_name: "some content", language: "some content", last_name: "some content", role: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end


end
