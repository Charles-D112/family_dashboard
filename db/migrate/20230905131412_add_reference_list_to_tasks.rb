class AddReferenceListToTasks < ActiveRecord::Migration[7.0]
  def change
    add_reference :tasks, :list, null: true, foreign_key: true
  end
end
