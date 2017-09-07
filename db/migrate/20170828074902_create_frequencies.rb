class CreateFrequencies < ActiveRecord::Migration
  def change
    	create_table :frequencies do |t|
	 	t.string :frequency
	 end
  end
end
