class OrdersController < Sinatra::Base
 
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