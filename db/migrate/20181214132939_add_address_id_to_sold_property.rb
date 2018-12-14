class AddAddressIdToSoldProperty < ActiveRecord::Migration[5.2]
  def change
    add_column :sold_properties, :address_id, :integer
  end
end
