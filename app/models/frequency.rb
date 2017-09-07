class Frequency < ActiveRecord::Base
	has_many :orders
	has_many :comments,  	:through => :orders
	has_many :tasks,  		:through => :orders
	has_many :sites,  		:through => :orders
	has_many :clients, 		:through => :orders
end 