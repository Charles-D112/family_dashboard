class RemoveReferenceTutoFromTasks < ActiveRecord::Migration[7.0]
  def change
    remove_reference :tasks, :tuto, foreign_key: true
  end
end
