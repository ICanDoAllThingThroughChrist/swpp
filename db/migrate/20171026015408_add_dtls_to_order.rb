class AddDtlsToOrder < ActiveRecord::Migration[5.1]
  def change
  	add_column :orders, :created_date, :datetime
  	add_column :orders, :updated_date, :datetime
  end
end
