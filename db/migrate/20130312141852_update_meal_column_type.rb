class UpdateMealColumnType < ActiveRecord::Migration
  def up
    change_column :Meals, :rating, :float
  end

  def down
    change_column :Meals, :rating, :integer
  end
end
