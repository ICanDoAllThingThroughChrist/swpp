class DropColumnsToUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :password
  	remove_column :users, :order_id
  end
end
