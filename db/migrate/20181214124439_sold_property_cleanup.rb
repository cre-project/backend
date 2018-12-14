class SoldPropertyCleanup < ActiveRecord::Migration[5.2]
  def change
    remove_column :sold_properties, :name
    remove_column :sold_properties, :rent
    remove_column :sold_properties, :bedrooms
    remove_column :sold_properties, :bathrooms
    remove_column :sold_properties, :price_per_unit
    remove_column :sold_properties, :price_per_sf

    add_column :sold_properties, :square_feet, :float
  end
end
