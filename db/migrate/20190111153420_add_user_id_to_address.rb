class AddUserIdToAddress < ActiveRecord::Migration[5.2]
  def change
    add_reference :addresses, :user, type: :uuid, foreign_key: true
    remove_reference :companies, :address, type: :uuid, foreign_key: true
    remove_reference :properties, :address, type: :uuid, foreign_key: true
    remove_reference :rented_units, :address, type: :uuid, foreign_key: true
    remove_reference :sold_properties, :address, type: :uuid, foreign_key: true
  end
end
