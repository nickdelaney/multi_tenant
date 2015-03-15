class ChangeBirthdateFormatInStudents < ActiveRecord::Migration
  def change
  	change_column :students, :birthdate, :string
  end
end
