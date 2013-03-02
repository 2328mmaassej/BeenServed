class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.integer :dish_id
      t.integer :rating
      t.text :review
      t.string :picture

      t.timestamps
    end
  end
end
