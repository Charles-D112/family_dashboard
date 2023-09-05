class RemoveReferenceTropheeFromTasks < ActiveRecord::Migration[7.0]
  def change
    remove_reference :tasks, :trophee, foreign_key: true
  end
end
