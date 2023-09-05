class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.boolean :done
      t.boolean :display_tuto
      t.references :list, null: false, foreign_key: true
      t.references :tuto, null: false, foreign_key: true
      t.references :trophee, null: false, foreign_key: true
      t.references :owner, null: false, foreign_key: { to_table: :users }
      t.references :executor, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
