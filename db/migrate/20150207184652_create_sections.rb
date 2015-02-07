class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.text :description
      t.integer :class_size
      t.string :section_time
      t.references :preschool, index: true
      t.references :franchise, index: true

      t.timestamps null: false
    end
    add_foreign_key :sections, :preschools
    add_foreign_key :sections, :franchises
  end
end
