class RemoveTemplateFromPackage < ActiveRecord::Migration[5.2]
  def change
    remove_column :packages, :template, :string
  end
end
