class AddAddressIdToCompany < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :address_id, :integer
  end
end
