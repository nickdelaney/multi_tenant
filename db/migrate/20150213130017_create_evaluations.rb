class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.string :field
      t.string :field2
      t.string :field3
      t.string :picture
      t.references :student, index: true
      t.references :franchise, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :evaluations, :students
    add_foreign_key :evaluations, :franchises
    add_foreign_key :evaluations, :users
  end
end
