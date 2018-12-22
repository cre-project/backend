class AddDependenciesToPackageRentedUnit < ActiveRecord::Migration[5.2]
  def change
    add_column :package_rented_units, :package_id, :uuid
    add_column :package_rented_units, :rented_unit_id, :uuid
  end
end
