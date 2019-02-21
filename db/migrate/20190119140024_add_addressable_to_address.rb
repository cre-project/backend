class AddAddressableToAddress < ActiveRecord::Migration[5.2]
  def change
    add_reference :addresses, :addressable, type: :uuid, polymorphic: true
  end
end
