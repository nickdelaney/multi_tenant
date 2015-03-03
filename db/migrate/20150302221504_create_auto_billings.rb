class CreateAutoBillings < ActiveRecord::Migration
  def change
    create_table :auto_billings do |t|
      t.references :user, index: true
      t.string :amount
      t.integer :credits
      t.string :active

      t.timestamps null: false
    end
    add_foreign_key :auto_billings, :users
  end
end
