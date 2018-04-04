defmodule Dubber.UserApiTest do
use ExUnit.Case

test "create user success" do
  assert {:ok, _} = Userapi.create_user("account", "role", "email", "first_name", "last_name", "language")
end

end
