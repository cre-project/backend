class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages, id: :uuid do |t|
      t.string :template, default: "default"

      t.timestamps
    end
  end
end
