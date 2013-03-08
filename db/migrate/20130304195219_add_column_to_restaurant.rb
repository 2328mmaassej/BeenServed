class AddColumnToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :phone_number, :string
    add_column :restaurants, :district, :string
    add_column :restaurants, :city, :string
    add_column :restaurants, :postcode, :string
    add_column :restaurants, :country, :string
    add_column :restaurants, :lat, :decimal
    add_column :restaurants, :lng, :decimal
  end
end
