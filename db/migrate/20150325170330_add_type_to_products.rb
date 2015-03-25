class AddTypeToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :type, index: true
    add_foreign_key :products, :types
  end
end
