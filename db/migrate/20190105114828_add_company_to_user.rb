class AddCompanyToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :company, type: :uuid, foreign_key: true
    add_reference :companies, :user, type: :uuid
  end
end
