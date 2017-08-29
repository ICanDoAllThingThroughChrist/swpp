class CreateOrders < ActiveRecord::Migration
  def change
  	  	create_table :orders do |t|
	 	t.string :frequency
	 	t.string :client
	 	t.string :comment
	 	t.string :site
	 	t.string :task
	 end 
  end
end
