class AddPackageIdToProperty < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :package_id, :integer
  end
end
