class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters do |t|
      t.references :section, index: true
      t.references :franchise, index: true
      t.references :student, index: true

      t.timestamps null: false
    end
    add_foreign_key :rosters, :sections
    add_foreign_key :rosters, :franchises
    add_foreign_key :rosters, :students
  end
end
