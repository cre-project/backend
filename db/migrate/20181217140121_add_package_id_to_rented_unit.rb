class AddPackageIdToRentedUnit < ActiveRecord::Migration[5.2]
  def change
    add_column :rented_units, :package_id, :integer
  end
end
