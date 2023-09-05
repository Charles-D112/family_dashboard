class AddReferenceTutoToTasks < ActiveRecord::Migration[7.0]
  def change
    add_reference :tasks, :tuto, foreign_key: true, null: true
  end
end
