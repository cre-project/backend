class ChangeBedroomsToBeIntegerInPropertyUnits < ActiveRecord::Migration[5.2]
  def change
    change_column :property_units, :bedrooms, :integer
  end
end
