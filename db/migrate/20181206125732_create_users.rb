class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :license_number
      t.integer :phone_number
      t.string :title
      t.string :description
      t.date :subscription_expiration

      t.timestamps
    end
  end
end
