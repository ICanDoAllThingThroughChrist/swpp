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
    if !logged_in?
      erb :'/users/create_user'
    else
      redirect to '/orders'
    end
  end

  post '/signup' do
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect to "/orders"
    else 
      flash[:message] = @user.errors.full_messages.join(', ')
      redirect to '/signup'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'/users/login'
    else
      redirect to '/orders'
    end
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
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
    if !logged_in?
      redirect to '/login'
    else
      @orders = current_user.orders
      flash[:message] = "here are your current orders"
      erb :'/orders/orders'
    end
  end

  get '/orders/new' do 
    erb :'orders/create_order'
  end

  post '/orders' do
    if params["order"].empty?
      redirect to "/orders/new"      
    else
      @order = current_user.orders.create(:counter => params["order"]["counter"], :user_id => "#{session[:user_id]}".to_i-1)
      @order.save
      @site = Site.find_by(:site_dtl => params["order"]["site_id"][" id="])
      @site.orders << @order
      @task = Task.find_by(:task_dtl => params["order"]["task_id"][" id="])
      @task.orders << @order
      @frequency = Frequency.find_by(:frequency_dtl => params["order"]["frequency_id"][" id="])
      @frequency.orders << @order
      @client = Client.find_by(:client_dtl => params["order"]["client_id"][" id="])
      @client.orders << @order
      @status = Status.find_by(:status_dtl => params["order"]["status_id"][" id="])
      #binding.pry
      @status.orders << @order
      flash[:message] = "Successfully created order."
      redirect to '/orders'
    end
  end

  get '/orders/:id'do
    if logged_in?
      @user = User.find(session[:user_id])
      @order =Order.find_by_id(params[:id])
        if @order.user.id == current_user.id
          @orders = current_user.orders
          flash[:message] = "You are logged in to view an order."
          erb :'/orders/orders'
        else
          redirect to '/orders'
        end
    else 
      flash[:message] = "You must be logged in to view a order."
      redirect to '/login'
    end
  end

  get '/orders/:id/edit' do
    #binding.pry 
    if logged_in?
      #binding.pry
      @order = Order.find_by_id(params[:id])
      #binding.pry
        if @order.user.id == current_user.id 
          @orders = current_user.orders
          flash[:message] = "You are logged in to view an order."
          erb :'/orders/orders'
        else
          #binding.pry
          redirect to '/orders'
        end
          flash[:message] = "Please revise your order."
          erb :'orders/edit_order'
    else
      redirect to '/login'
    end
  end

  post '/orders/:id/edit' do 
    @order = Order.find_by_id(params[:id])
      if params["order"].empty?
        redirect to "/orders/#{@order.id}/edit"
      else
        @site = Site.find_or_create_by(:site_dtl => params["order"]["site_id"][" id="])
        @site.orders << @order
        @task = Task.find_or_create_by(:task_dtl => params["order"]["task_id"][" id="])
        @task.orders << @order
        @frequency = Frequency.find_or_create_by(:frequency_dtl => params["order"]["frequency_id"][" id="])
        @frequency.orders << @order
        @client = Client.find_or_create_by(:client_dtl => params["order"]["client_id"][" id="])
        @client.orders << @order
        flash[:message] = "Successfully edited order."
        redirect to "/orders/#{@order.id}"
      end
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      if session[:user_id]
        @current_user ||= User.find_by(id: session[:user_id]) 
      end
    end
  end

end
