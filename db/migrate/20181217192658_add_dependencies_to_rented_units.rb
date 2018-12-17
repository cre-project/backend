class AddDependenciesToRentedUnits < ActiveRecord::Migration[5.2]
  def change
    add_column :rented_units, :user_id, :uuid
    add_column :rented_units, :address_id, :uuid
  end
end
