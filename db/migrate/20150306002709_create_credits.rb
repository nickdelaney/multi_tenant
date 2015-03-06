class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.references :franchise, index: true
      t.string :count
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :credits, :franchises
    add_foreign_key :credits, :users
  end
end
