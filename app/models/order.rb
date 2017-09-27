class Order < ActiveRecord::Base
	belongs_to :client
	belongs_to :task
	belongs_to :comment 
	belongs_to :site 
	belongs_to :frequency 
	belongs_to :user
	belongs_to :status
end 