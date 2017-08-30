class AddClientDtlToClients < ActiveRecord::Migration[5.1]
  def change
  	  	 add_column :clients, :client_dtl, :integer
  end
end
