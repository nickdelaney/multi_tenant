class CreatePreschools < ActiveRecord::Migration
  def change
    create_table :preschools do |t|
    	t.string :name
    	t.string :description
    	t.string :address_1
    	t.string :address_2
    	t.string :city
    	t.string :state
    	t.string :zip
    	t.string :phone
    	t.string :director
    	t.integer :franchise_id
      	t.timestamps
    end
  end
end
