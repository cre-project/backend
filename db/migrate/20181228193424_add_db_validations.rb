class AddDbValidations < ActiveRecord::Migration[5.2]
  def change
    change_column_null :property_units, :bedrooms, false
    change_column_null :property_units, :bathrooms, false
    change_column_null :property_units, :current_rent, false

    change_column_null :properties, :price, false
    change_column_null :properties, :address_id, false

    change_column_null :users, :email, false

    change_column_null :operating_statement_fields, :name, false
    change_column_null :operating_statement_fields, :is_income, false

    change_column_null :rented_units, :bedrooms, false
    change_column_null :rented_units, :current_rent, false
  end
end
