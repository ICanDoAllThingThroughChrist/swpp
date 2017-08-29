class Client < ActiveRecord::Base
	has_many :orders
	has_many :comments,  	:through => :orders
	has_many :tasks,  		:through => :orders
	has_many :sites,  		:through => :orders
	has_many :freqency,     :through => :orders
end