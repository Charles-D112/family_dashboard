class RemoveReferenceExecutorFromTasks < ActiveRecord::Migration[7.0]
  def change
    remove_reference :tasks, :executor, foreign_key: { to_table: :users }
  end
end
