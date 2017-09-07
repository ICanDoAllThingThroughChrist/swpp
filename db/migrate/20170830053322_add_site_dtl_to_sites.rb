class AddSiteDtlToSites < ActiveRecord::Migration[5.1]
  def change
  	  	add_column :sites, :site_dtl, :integer
  end
end
