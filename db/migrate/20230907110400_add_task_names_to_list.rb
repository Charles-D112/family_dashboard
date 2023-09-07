class AddTaskNamesToList < ActiveRecord::Migration[7.0]
  def change
    add_column :lists, :task_names, :text
  end
end
