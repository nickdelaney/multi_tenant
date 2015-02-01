class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.string :description
      t.integer :class_size
      t.string :section_time
      t.integer :preschool_id

      t.timestamps
    end
  end
end
