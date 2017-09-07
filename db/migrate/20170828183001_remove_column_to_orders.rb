class RemoveColumnToOrders < ActiveRecord::Migration
  def change
  	remove_column :orders, :frequency
  	remove_column :orders, :client
  	remove_column :orders, :comment
  	remove_column :orders, :site
  	remove_column :orders, :task
  end
end
