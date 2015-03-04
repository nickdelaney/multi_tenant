class AddColumnsToPreschools < ActiveRecord::Migration
  def change
    add_column :preschools, :name, :string
    add_column :preschools, :description, :text
    add_column :preschools, :address_1, :string
    add_column :preschools, :address_2, :string
    add_column :preschools, :city, :string
    add_column :preschools, :state, :string
    add_column :preschools, :zip, :integer
    add_column :preschools, :phone, :string
    add_column :preschools, :director, :string
    add_column :preschools, :franchise_id, :integer
  end
end
