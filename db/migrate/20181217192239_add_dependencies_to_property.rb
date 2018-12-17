class AddDependenciesToProperty < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :package_id, :uuid
    add_column :properties, :user_id, :uuid
    add_column :properties, :address_id, :uuid
  end
end
