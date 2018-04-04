# elixir-phoenix


# Clone the repository

cd to the application root folder

$ cd create_user_app

Install dependencies with mix deps.get
$ mix deps.get

# To start Application

Make sure ENV variables are set [config/config.exs]

Connecting to Dubber API, the following are required:

1. URL     eg:"https://api.dubber.net/ci"
2. CLIENT_ID
3. CLIENT_SECRET
4. USERNAME
5. PASSWORD

Setup DB with mix ecto.migrate

$ mix ecto.migrate

Start Phoenix endpoint with mix phoenix.server

$ mix phoenix.server
