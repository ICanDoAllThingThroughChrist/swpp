class Site < ActiveRecord::Base
	has_many :orders
	has_many :comments,  	:through => :orders
	has_many :tasks,  		:through => :orders
	has_many :clients,  	:through => :orders
	has_many :freqencys,    :through => :orders
end 