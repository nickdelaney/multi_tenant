class CreateBuses < ActiveRecord::Migration
  def change
    create_table :buses do |t|
      t.string :name
      t.string :description
      t.references :franchise, index: true

      t.timestamps null: false
    end
    add_foreign_key :buses, :franchises
  end
end
