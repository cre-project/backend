class CreatePropertyUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :property_units do |t|
      t.integer :bedrooms
      t.integer :bathrooms
      t.float :current_rent
      t.float :potential_rent

      t.timestamps
    end
  end
end
