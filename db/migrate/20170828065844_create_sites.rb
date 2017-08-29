class CreateSites < ActiveRecord::Migration
  def change
  	 	 create_table :sites do |t|
	 	t.string :site
	 end 
  end
end
