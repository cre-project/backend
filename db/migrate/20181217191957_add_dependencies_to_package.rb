class AddDependenciesToPackage < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :property_id, :uuid
    add_column :packages, :rented_unit_id, :uuid
    add_column :packages, :sold_property_id, :uuid
    add_column :packages, :user_id, :uuid
  end
end
