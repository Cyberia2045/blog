require "sinatra"
require "sinatra/activerecord"
#require "faker"
require "./models"


set :database, "sqlite3:test.sqlite3"


get "/" do
	@users = User.all

	erb :index
end
