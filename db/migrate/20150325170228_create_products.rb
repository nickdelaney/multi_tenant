class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :franchise, index: true
      t.string :name
      t.string :cost

      t.timestamps null: false
    end
    add_foreign_key :products, :franchises
  end
end
