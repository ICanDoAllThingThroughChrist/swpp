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
         #binding.pry
         @orders = Order.all.where("user_id = ?", "#{session[:user_id]}".to_i-1)
         flash[:message] = "here are the current orders"
         #binding.pry 
         erb :'/orders/orders'
       end
     end

  	get '/orders/new' do
        #binding.pry
  		  erb :'orders/create_order'
  	end

  	post '/orders' do
  			#binding.pry
  		  #@order = Order.create(params["order"])
          if params["order"].empty?
            #binding.pry
            redirect to "/orders/new"      
          else
            #binding.pry
            @order = Order.create(:counter => params["order"]["counter"], :user_id => "#{session[:user_id]}".to_i-1)
            @order.save
            @site = Site.find_by(:site_dtl => params["order"]["site_id"][" id="])
            @site.orders << @order
            @task = Task.find_by(:task_dtl => params["order"]["task_id"][" id="])
            @task.orders << @order
            @frequency = Frequency.find_by(:frequency_dtl => params["order"]["frequency_id"][" id="])
            @frequency.orders << @order
            @client = Client.find_by(:client_dtl => params["order"]["client_id"][" id="])
            @client.orders << @order
            flash[:message] = "Successfully created order."
            #binding.pry
          end
  	end

    get '/orders/:id'do
      if session[:user_id]
        #binding.pry #find a single tweet from :id
        @order = Order.find_by_id(params[:id])
        # binding.pry
        flash[:message] = "You are logged in to view an order."
        erb :'/orders/show_order'
      else
        flash[:message] = "You must be logged in to view a order."
        redirect to '/login'
      end
    end

    get '/orders/:id/edit' do
      if logged_in?
      @order = Order.find_by_id(params[:id])
      #binding.pry
        if @order.user_id == current_user.id - 1
            erb :'orders/edit_order'
        else
          redirect to '/orders'
        end
      else
        redirect to '/login'
      end
    end

    post '/orders/:id/edit' do
    "Hello World"
    end

    helpers do
      def logged_in?
        !!current_user
      end

      def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
      end
    end

end
