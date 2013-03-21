class UpdateMealColumnType < ActiveRecord::Migration
  def up
    change_column :meals, :rating, :float
  end

  def down
    change_column :meals, :rating, :integer
  end
end
