class AddPackageIdToSoldProperty < ActiveRecord::Migration[5.2]
  def change
    add_column :sold_properties, :package_id, :integer
  end
end
