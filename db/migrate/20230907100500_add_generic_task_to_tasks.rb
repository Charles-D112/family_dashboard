class AddGenericTaskToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :generic_task, :boolean, default: false
  end
end
