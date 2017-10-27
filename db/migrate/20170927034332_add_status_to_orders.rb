class AddStatusToOrders < ActiveRecord::Migration[5.1]
  def change
  	  add_column :orders, :status_id, :integer
  end
end
