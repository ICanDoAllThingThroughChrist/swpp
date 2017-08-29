class DropWorkorders < ActiveRecord::Migration
  def change
		drop_table :workorders
  end
end


