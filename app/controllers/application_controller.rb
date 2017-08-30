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
         binding.pry
         @orders = []
         orders = Order.find_by user_id: "#{session[:user_id]}".to_i-1
         @orders << orders
         task = Task.find_by user_id: "#{session[:user_id]}".to_i-1
           if task != nil
           @user.tasks << task 
           else
           flash[:message] = "there are no task associated with this user"
           end
         #binding.pry 
         erb :'/orders/orders'
       end
     end

  	get '/orders/new' do
        # binding.pry
  		  @tasks = Task.all
  		  @frequencies = Frequency.all
  		  @sites = Site.all
  		  @clients = Client.all
  		  erb :'orders/create_order'
  	end

  	post '/orders' do
  			#binding.pry
  		  #@order = Order.create(params["order"])
          if params["order"].empty?
            #binding.pry
            redirect to "/orders/new"      
          else
            binding.pry
            @order = Order.create(:counter => params["order"]["counter"], :user_id => "#{session[:user_id]}".to_i-1)
            @site = Site.find_by(:site_dtl => params["order"]["site_id"][" id="])
            @site.order << @order
            @task = Task.find_by(:task_dtl => params["order"]["task_id"][" id="])
            @task.order << @order
            @frequency = Frequency.find_by(:frequency_dtl => params["order"]["frequency_id"][" id="])
            @frequency.order << @order
            @client = Client.find_by(:client_dtl => params["order"]["client_id"][" id="])
            @client.order << @order
            @order.save
            flash[:message] = "Successfully created order."
            binding.pry
          end
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
