class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :amount
      t.string :description
      t.integer :tran_id
      t.references :franchise, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :transactions, :franchises
    add_foreign_key :transactions, :users
  end
end
