class AddColumnTotalPointsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :total_points, :integer
  end
end
