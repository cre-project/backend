class AddAddressIdToRentedUnit < ActiveRecord::Migration[5.2]
  def change
    add_reference :rented_units, :address, type: :uuid, foreign_key: true
  end
end
