class CreateBuses < ActiveRecord::Migration
  def change
    create_table :buses do |t|
      t.string :name
      t.string :description
      t.integer :franchise_id

      t.timestamps
    end
  end
end
