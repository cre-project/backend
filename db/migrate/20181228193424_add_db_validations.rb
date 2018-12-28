class AddDbValidations < ActiveRecord::Migration[5.2]
  def change
    change_column_null :property_units, :bedrooms, false
    change_column_null :property_units, :bathrooms, false
    change_column_null :property_units, :current_rent, false
  end
end
