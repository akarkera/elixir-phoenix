# elixir-phoenix


clone the repository

then cd to the application root folder : cd create_user_app
Install dependencies with mix deps.get
$ mix deps.get
To start DubberConnect
Make sure ENV variables are set [config/config.exs]
Connecting to Dubber API, the following are required:

URL     eg:"https://api.dubber.net/ci"
CLIENT_ID
CLIENT_SECRET
USERNAME
PASSWORD

Setup DB with mix ecto.migrate
$ mix ecto.migrate
Start Phoenix endpoint with mix phoenix.server
$ mix phoenix.server
