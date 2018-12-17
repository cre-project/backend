class AddDependenciesToSoldProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :sold_properties, :user_id, :uuid
    add_column :sold_properties, :address_id, :uuid
  end
end
