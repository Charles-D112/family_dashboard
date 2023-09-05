class AddReferenceExecutorToTasks < ActiveRecord::Migration[7.0]
  def change
    add_reference :tasks, :executor, null: true, foreign_key: { to_table: :users }
  end
end
