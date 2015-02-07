class CreatePreschools < ActiveRecord::Migration
  def change
    create_table :preschools do |t|
      t.string :name
      t.text :description
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :director
      t.references :franchise, index: true

      t.timestamps null: false
    end
    add_foreign_key :preschools, :franchises
  end
end
