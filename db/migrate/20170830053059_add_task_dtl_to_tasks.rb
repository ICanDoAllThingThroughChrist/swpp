class AddTaskDtlToTasks < ActiveRecord::Migration[5.1]
  def change
  	  add_column :tasks, :task_dtl, :integer
  end
end
