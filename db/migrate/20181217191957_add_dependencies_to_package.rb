class AddDependenciesToPackage < ActiveRecord::Migration[5.2]
  def change
    add_reference :packages, :property, type: :uuid, foreign_key: true
    add_reference :packages, :user, type: :uuid, foreign_key: true
  end
end
