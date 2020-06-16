class AddPointsAndScoreToDispatch < ActiveRecord::Migration[6.0]
  def change
    add_column :dispatches, :points, :integer, default: 1
    add_column :dispatches, :score, :float, default: 0
  end
end
