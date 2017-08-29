class Order < ActiveRecord::Base
	belongs_to :client, counter_cache: :count_of_clients
	belongs_to :task, counter_cache: :count_of_tasks
	belongs_to :comment, counter_cache: :count_of_comments
	belongs_to :site, counter_cache: :count_of_sites
	belongs_to :frequency, counter_cache: :count_of_frequencies
	belongs_to :user
end 