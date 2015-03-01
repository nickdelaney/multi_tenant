class AddCustomerProfileIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :customer_profile_id, :integer
  end
end
