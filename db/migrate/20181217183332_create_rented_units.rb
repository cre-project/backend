class CreateRentedUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :rented_units, id: :uuid do |t|
      t.integer :year_built
      t.integer :bedrooms
      t.float :bathrooms
      t.string :image_url
      t.float :current_rent

      t.timestamps
    end
  end
end
