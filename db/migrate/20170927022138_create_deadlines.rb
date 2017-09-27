class CreateDeadlines < ActiveRecord::Migration[5.1]
  def change
  	 create_table :deadlines do |t|
	 t.string :deadline
	end
  end
end
