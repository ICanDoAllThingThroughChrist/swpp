class AddCounterToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :counter, :string
  end
end

# class AddPartNumberToProducts < ActiveRecord::Migration[5.0]
# #   def change
#     add_column :products, :part_number, :string
#   end
# end
