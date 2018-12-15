class AddAddressIdToRentedUnit < ActiveRecord::Migration[5.2]
  def change
    add_column :rented_units, :address_id, :integer
  end
end
