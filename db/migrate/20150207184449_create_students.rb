class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthdate
      t.references :user, index: true
      t.references :franchise, index: true
      t.references :preschool, index: true

      t.timestamps null: false
    end
    add_foreign_key :students, :users
    add_foreign_key :students, :franchises
    add_foreign_key :students, :preschools
  end
end
