class AddExistingTaskToList < ActiveRecord::Migration[7.0]
  def change
    add_column :lists, :existing_task_id, :integer
  end
end
