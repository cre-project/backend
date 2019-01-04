class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pabbly_customer_id, :string
    add_column :users, :subscription, :string
  end
end
