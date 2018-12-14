class AddUserIdToSoldProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :sold_properties, :user_id, :integer
  end
end
