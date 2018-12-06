class CreateSoldProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :sold_properties do |t|
      t.string :name
      t.integer :year_built
      t.integer :rent
      t.integer :bedrooms
      t.float :bathrooms
      t.float :sales_price
      t.integer :num_units
      t.float :price_per_unit
      t.float :price_per_sf
      t.float :cap_rate
      t.float :grm
      t.date :close_of_escrow
      t.string :image_url

      t.timestamps
    end
  end
end
