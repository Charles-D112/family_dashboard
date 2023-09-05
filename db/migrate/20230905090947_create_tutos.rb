class CreateTutos < ActiveRecord::Migration[7.0]
  def change
    create_table :tutos do |t|
      t.string :name
      t.text :description
      t.string :url

      t.timestamps
    end
  end
end
