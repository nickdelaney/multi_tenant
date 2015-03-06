class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.references :user, index: true
      t.references :franchise, index: true
      t.references :section, index: true

      t.timestamps null: false
    end
    add_foreign_key :checkins, :users
    add_foreign_key :checkins, :franchises
    add_foreign_key :checkins, :sections
  end
end
