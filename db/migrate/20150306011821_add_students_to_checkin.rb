class AddStudentsToCheckin < ActiveRecord::Migration
  def change
    add_reference :checkins, :student, index: true
    add_foreign_key :checkins, :students
  end
end
