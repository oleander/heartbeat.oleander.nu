require "./server"
disable :run
set :root, Pathname(__FILE__).dirname
run Sinatra::Application