class RemoveNullConstraintOnAddress < ActiveRecord::Migration[5.2]
  def change
    change_column :properties, :address_id, :uuid, :null => true
  end
end
