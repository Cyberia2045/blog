require "sinatra"
require "sinatra/activerecord"
require "sinatra/flash"
#require "faker"
require "./models"


set :database, "sqlite3:test.sqlite3"
enable :sessions


get "/" do
	@users = User.all
	@posts = Post.all

	session[:visited] = "I'm here"

	p session[:visited]

	erb :index
	
end

post '/users' do
	user = User.new

	user.email = params["email"]
	user.password = params["password"]

	user.save

	user = User.where(email: params[:email]).first
	if user && user.password == params[:password]
		session[:user_id] = user.id
		flash[:notice] = "You've successfully signed in"


		redirect "/"
	end


end

get "/users/:id" do
	@user = User.find(params[:id])

	erb :user_show
end

post '/posts' do
	post = Post.new

	post.title = params["title"]
	post.body = params["body"]
	post.user_id = session[:user_id]

	post.save

	redirect "/"
end

get "/posts/delete/:id" do
	post = Post.find(params[:id])
	post.destroy

	redirect "/"
end

get "/posts/:id" do
	@post = Post.find(params[:id])

	erb :post_show
end

get '/posts/edit/:id' do
	@post = Post.find(params[:id])

	erb :post_edit
end

post "/posts/edit/:id" do
	@post = Post.find(params[:id])

	@post.title = params[:title]
	@post.body = params[:body]

	@post.save

	redirect "/posts/#{@post.id}"
end

get "/sign_in" do
	erb :sign_in
end

get "/sign_up" do
	erb :sign_up
end

post "/sessions/new" do
	user = User.where(email: params[:email]).first
	if user && user.password == params[:password]
		session[:user_id] = user.id
		flash[:notice] = "You've successfully signed in"


		redirect "/"
	else
		redirect back
		#flash.now[:badpassword] = "Why don't you try that again?"
	end

end

get "/sign-out" do
	session.clear
	flash[:notice] = "You've successfully signed out"

	redirect "/"
end





