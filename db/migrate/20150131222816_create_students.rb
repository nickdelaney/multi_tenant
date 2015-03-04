class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthdate
      t.integer :user_id
      t.string :preschool_id

      t.timestamps
    end
  end
end
