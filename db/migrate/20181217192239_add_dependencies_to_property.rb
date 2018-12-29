class AddDependenciesToProperty < ActiveRecord::Migration[5.2]
  def change
    add_reference :properties, :package, type: :uuid, foreign_key: true
    add_reference :properties, :user, type: :uuid, foreign_key: true
    add_reference :properties, :address, type: :uuid, foreign_key: true
  end
end
