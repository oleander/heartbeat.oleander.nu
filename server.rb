require "sinatra"

get "/" do
  halt 200, "a heartbeat"
end