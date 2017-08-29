require './config/environment'
require 'sinatra/base'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
     set :views, 'app/views'
     enable :sessions
     use Rack::Flash
     set :session_secret, "password_security"
  end

    get '/' do
    	erb :index
  	end

   	get '/signup' do
	    if !session[:user_id]
	      #binding.pry
	     erb :'/users/create_user'
	   else
	     redirect to '/orders'
	   end
  	end

  	post '/signup' do
      username = params["username"].size
      email = params["email"].size
      password = params["password"].size
      if username < 1 || email < 1 || password < 1
        flash[:message] = "Inputs may not be blank."
      redirect to "/signup"
      else
      @user = User.create(username: params["username"], email: params["email"], password: params["password"])
      @user.save
      session[:user_id] = @user.id
      redirect to "/orders"
      end
    end

    get '/login' do
      if !session[:user_id]
        erb :'/users/login'
      else
        redirect to '/orders'
      end
    end

    post '/login' do
      @user = User.find_by(:username => params[:username])
      #user = User.find_by(:username => params[:username])
      if @user && @user.authenticate(params[:password])
    # if user && user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:message] = "You have signed in successfully."
        redirect to '/orders'
      else
        flash[:message] = "Invalid username or password. Please try again."
        redirect to '/login'
      end
    end

    get '/logout' do
      session.clear
      redirect to '/login'
    end

    get '/orders' do
       if !session[:user_id]
         redirect to '/login'
       else
         @user = User.find(session[:user_id])
         @orders = Order.all
         erb :'/orders/orders'
       end
     end

	get '/orders/new' do
		  @tasks = Task.all
		  @frequencies = Frequency.all
		  @sites = Site.all
		  @clients = Client.all
		  erb :'orders/new'
	end

	post '/orders' do
			binding.pry
		  @order = Order.create(params["orders"])
	end



end
