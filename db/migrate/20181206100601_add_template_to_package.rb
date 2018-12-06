class AddTemplateToPackage < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :template, :string, default: 'default'
  end
end
