class AddColumnsToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :comment_id, :integer
  	add_column :orders, :frequency_id,:integer
  	add_column :orders, :site_id, :integer
  	add_column :orders, :task_id, :integer
  end
end
