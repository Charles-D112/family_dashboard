class RemoveReferenceListFromTasks < ActiveRecord::Migration[7.0]
  def change
    remove_reference :tasks, :list, foreign_key: true
  end
end
