defmodule Userapi do

  def create_user(account, role, email, first_name, last_name, language) do
    client_id = Application.get_env(:dubber, :client_id)
    client_secret = Application.get_env(:dubber, :client_secret)
    username = Application.get_env(:dubber, :username)
    password = Application.get_env(:dubber, :password)
    base_uri = Application.get_env(:dubber, :url)
    url = "#{base_uri}/v1/token?client_id=#{client_id}&client_secret=#{client_secret}&username=#{username}&password=#{password}&grant_type=password"
    HTTPoison.start
    case  HTTPoison.post(url,'{}',[]) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body = Poison.decode!(body)
        access_token = body["access_token"]
        headers = ["Authorization": "Bearer #{access_token}", "Content-Type": "application/json"]
        url = '#{base_uri}/v1/accounts/#{account}/users'
        body ='{
        "role": "#{role}",
        "first_name": "#{first_name}",
        "last_name": "#{last_name}",
        "email": "#{email}",
        "language": "#{language}"
        }'

        HTTPoison.post(url,body,headers)
      _ ->
        ""
    end
  end
end
