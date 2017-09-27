class AddStatusDtlToStatuses < ActiveRecord::Migration[5.1]
  def change
  	add_column :statuses, :status_dtl, :integer
  end
end
