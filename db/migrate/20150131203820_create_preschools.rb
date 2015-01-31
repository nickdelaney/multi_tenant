class CreatePreschools < ActiveRecord::Migration
  def change
    create_table :preschools do |t|

      t.timestamps
    end
  end
end
