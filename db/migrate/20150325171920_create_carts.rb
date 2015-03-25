class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.references :franchise
      t.references :user
      t.references :product
      t.string :quantity

      t.timestamps null: false
    end
  end
end
