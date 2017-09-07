class Comment < ActiveRecord::Base
	has_many :orders
	has_many :clients, 		:through => :orders
	has_many :tasks, 		:through => :orders
	has_many :sites, 		:through => :orders
	has_many :frequencys,	:through => :orders
end 