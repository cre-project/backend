class RentedUnitsCleanup < ActiveRecord::Migration[5.2]
  def change
    remove_column :rented_units, :name
    remove_column :rented_units, :rent
    remove_column :rented_units, :sales_price
    remove_column :rented_units, :num_units
    remove_column :rented_units, :price_per_unit
    remove_column :rented_units, :price_per_sf
    remove_column :rented_units, :cap_rate
    remove_column :rented_units, :grm
    remove_column :rented_units, :close_of_escrow

    add_column :rented_units, :current_rent, :float
  end
end
