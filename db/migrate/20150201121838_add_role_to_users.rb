class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string

    User.create! do |u|
            u.email     = 'admin@admin.com'
            u.password    = 'admin123'
            u.role = 'administrator'
            u.franchise_id = '5'
     end
  end
end
