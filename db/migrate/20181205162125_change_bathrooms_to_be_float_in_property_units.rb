class ChangeBathroomsToBeFloatInPropertyUnits < ActiveRecord::Migration[5.2]
  def change
    change_column :property_units, :bathrooms, :float
  end
end
