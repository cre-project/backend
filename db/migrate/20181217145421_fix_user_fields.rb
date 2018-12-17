class FixUserFields < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :description, :string
    add_column :users, :fax, :string
  end
end
